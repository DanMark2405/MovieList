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
    
    func updateView(){
          self.objectWillChange.send()
      }
    
}
