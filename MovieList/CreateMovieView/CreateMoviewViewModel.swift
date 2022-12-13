//
//  CreateMoviewViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 11.12.22.
//

import Foundation
import Combine

class CreateMoviewViewModel: ObservableObject {
    
    
    @Published var title = ""
    @Published var overview = ""
    @Published var posterPath = ""
    @Published var voteAverage = ""
    @Published var date = Date()
    
    @Published var isDisabled = true
    
    @Published var genres = [Genre]()
    @Published var selectedGenres = Set<Genre>()
    @Published var actors = Set<Actor>()
    
    
    var persistance = PersistenceController.shared
    var movie: Movie?
    var navTitle = "Create Movie"
    var buttonTitle = "Create"
    
    init(movie: Movie? = nil) {
       
        fetchGenre()
        Publishers.CombineLatest3($title, $overview, $posterPath)
            .map { (a, b, c) in
                return a.isEmpty || b.isEmpty || c.isEmpty
            }
            .print()
            .assign(to: &$isDisabled)
        if let movie = movie {
            self.movie = movie
            self.navTitle = "Edit Movie"
            self.buttonTitle = "Edit"
            self.title = movie.title
            self.overview = movie.overview
            self.date = movie.releaseDate
            self.posterPath = movie.posterPath
            self.voteAverage = "\(movie.voteAverage)"
            self.selectedGenres = movie.genres
            self.actors = movie.actors
        }
    }
    
    func clean() {
        self.title = ""
        self.overview = ""
        self.date = Date()
        self.posterPath = ""
        self.voteAverage = ""
        self.selectedGenres = []
        self.actors = []
    }
    
    func create() {
        var movie: Movie
        if let movieItem = self.movie {
            movie = movieItem
        } else {
          movie = Movie(context: persistance.viewContext)
        }
       
        movie.title = title
        movie.overview = overview
        movie.posterPath = posterPath
        movie.releaseDate = date
        movie.voteAverage = Double(voteAverage) ?? 0
        selectedGenres.forEach{ movie.genres.insert($0) }
        actors.forEach{ movie.actors.insert($0) }
        persistance.saveContext()
    }
    
    func fetchGenre() {
        self.genres = persistance.fetchGenres()
    }
    
    func isSelectGenre(_ genre: Genre) -> Bool {
        selectedGenres.contains(genre)
    }
    
    func toggleGenre(_ genre: Genre) {
        if selectedGenres.contains(genre) {
            selectedGenres.remove(genre)
        } else {
            selectedGenres.insert(genre)
        }
    }
    
    func addActor(_ actor: Actor) {
        self.actors.insert(actor)
    }
    
    
}
