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
    
    
    func fetchMovies() -> [Movie] {
        let request = Movie.fetchRequest()
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

}
