//
//  MovieListDetailViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import Foundation

class MovieListDetailViewModel: ObservableObject {
    var movieList: MovieList
    @Published var name = ""
    @Published var isDisabled = false
    
    init(movieList: MovieList) {
        self.movieList = movieList
        self.name = movieList.name
        $name
            .map {$0.isEmpty}
            .assign(to: &$isDisabled)
        
    }
    
    func editList() {
        movieList.name = name
        PersistenceController.shared.saveContext()
    }
    
    func updateView(){
          self.objectWillChange.send()
      }
    
}
