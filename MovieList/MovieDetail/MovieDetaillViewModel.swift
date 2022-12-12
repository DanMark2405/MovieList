//
//  MovieDetaillViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
