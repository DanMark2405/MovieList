//
//  Persistence.swift
//  MovieList
//
//  Created by Daniil Markish on 6.12.22.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()

    lazy var container: NSPersistentContainer = {
          let container = NSPersistentContainer(name: "MovieList")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
        container.viewContext.automaticallyMergesChangesFromParent = true
          return container
      }()

    lazy var viewContext: NSManagedObjectContext = {
        return container.viewContext
      }()
    
    
     func saveUser(name: String, surname: String, email: String) {
        container.performBackgroundTask { context in
            let object = User(context: context)
            object.firstName = name
            object.lastName = surname
            object.email = email
            try? context.save()
        }
    }
    
     func getUsers() -> [User] {
        let request = User.fetchRequest()
        return (try? viewContext.fetch(request)) ?? []
    }
    
    
    func fetchMovies(
        searchText: String? = nil,
        minRate: Int = 0,
        maxRate: Int = 10
    ) -> [Movie] {
        let request = Movie.fetchRequest()
        
        
        let ratePredicate = NSPredicate(format: "%K <= %i AND %K >= %i",
                                          #keyPath(Movie.voteAverage),
                                          maxRate,
                                          #keyPath(Movie.voteAverage),
                                          minRate)
        
        var mainPredicate: NSCompoundPredicate?
        
        if let searchText = searchText, !searchText.isEmpty {
            let searchPredicate = NSPredicate(format: "%K BEGINSWITH[cd] %@", #keyPath(Movie.title), searchText)
            mainPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [ratePredicate, searchPredicate])
        }
        
        request.predicate = mainPredicate ?? ratePredicate
        request.sortDescriptors = [ NSSortDescriptor(keyPath: \Movie.title, ascending: true)]
        return (try? viewContext.fetch(request)) ?? []
    }
    
    func fetchGenres() -> [Genre] {
        let request = Genre.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Genre.name, ascending: true)]
        return (try? viewContext.fetch(request)) ?? []
    }
    
    func fetchActors(searchText: String = "") -> [Actor] {
        let request = Actor.fetchRequest()
        
        if !searchText.isEmpty {
            let namePredicate = NSPredicate(format: "%K BEGINSWITH[cd] %@", #keyPath(Actor.firstName), searchText)
            let surnamePredicate = NSPredicate(format: "%K BEGINSWITH[cd] %@", #keyPath(Actor.lastName), searchText)
            let actorPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [namePredicate, surnamePredicate])
            request.predicate = actorPredicate
        }
        
        request.sortDescriptors = [ NSSortDescriptor(keyPath: \Actor.firstName, ascending: true),
                                    NSSortDescriptor(keyPath: \Actor.lastName, ascending: true)]
        
        return (try? viewContext.fetch(request)) ?? []
    }
    
    func fetchMovieLists() -> [MovieList] {
        let request = MovieList.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \MovieList.name, ascending: true)]
        return (try? viewContext.fetch(request)) ?? []
    }
    
     func saveContext () {
          if viewContext.hasChanges {
              do {
                  try viewContext.save()
              } catch {
                  viewContext.rollback()
              }
          }
      }
    
    func preloading() {
//        guard !UserDefaults.standard.bool(forKey: "hasStandardData")  else {
//            return
//        }
        
        if let bundlePath = Bundle.main.path(forResource: "Genres", ofType: "json"),
           let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8) {
            let model = try? JSONDecoder().decode(PreloadingGenreData.self, from: jsonData)
            if let model = model {
                for item in model.genres {
                    let genre = Genre(context: viewContext)
                    genre.name = item.name
                    genre.id = item.id
                }
            }
            
        }
        
        var actors = Set<Actor>()
        
        if let bundlePath = Bundle.main.path(forResource: "actors", ofType: "json"),
           let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8) {
            let model = try? JSONDecoder().decode([PreloadingActor].self, from: jsonData)
            if let model = model {
                for item in model {
                    let actor = Actor(context: viewContext)
                    actor.firstName = item.firstName
                    actor.lastName = item.lastName
                    actor.imagePath = item.imagePath
                    actors.insert(actor)
                }
            }
            
        }
        
        if let bundlePath = Bundle.main.path(forResource: "movies", ofType: "json"),
           let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8) {
            let model = try? JSONDecoder().decode([PreloadingMovie].self, from: jsonData)
            if let model = model {
                for item in model {
                    let movie = Movie(context: viewContext)
                    movie.releaseDate = (try? Date(item.releaseDate, strategy: .dateTime)) ?? Date()
                    movie.title = item.title
                    movie.overview = item.overview
                    movie.voteAverage = item.voteAverage
                    movie.posterPath = item.posterPath
                    movie.actors = actors
                   
                }
            }
            
        }
        

        
        saveContext()
        UserDefaults.standard.set(true, forKey: "hasStandardData")
        
        
    }

}
