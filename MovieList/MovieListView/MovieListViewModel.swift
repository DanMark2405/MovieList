//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 11.12.22.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies = [Movie]()
    
    var persistance = PersistenceController.shared
    init() {
    
    }
    
    func fetchMovies() {
        movies = persistance.fetchMovies()
    }
    
    func deleteMovie(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }
        let movie = movies[index]
        persistance.viewContext.delete(movie)
        persistance.saveContext()
    }
    
    func saveContext() {
        persistance.saveContext()
    }
    
    func updateView(){
          self.objectWillChange.send()
      }
    
    
}
