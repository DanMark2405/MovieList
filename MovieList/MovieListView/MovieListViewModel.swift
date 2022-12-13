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
        movies = [exMovie, exMovie, exMovie, exMovie, exMovie, exMovie]
        
    }
    
    func fetchMovies() {
        //movies.append(contentsOf: persistance.fetchMovies())
    }
    
}
