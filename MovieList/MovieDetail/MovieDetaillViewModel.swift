//
//  MovieDetaillViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie
    @Published var commentText = ""
    @Published var rate = 0
    @Published var isDisabled = false
    
    init(movie: Movie) {
        self.movie = movie
        $commentText
            .map { $0.isEmpty}
            .assign(to: &$isDisabled)
        
    }
    
    func addComment() {
        
    }
    
    
}
