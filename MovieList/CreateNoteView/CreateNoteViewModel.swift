//
//  CreateNoteViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import Foundation
import Combine

class CreateNoteViewModel: ObservableObject {
    @Published var rate = 1
    @Published var text = ""
    @Published var isDisabled = false
    @Published var selectedLists = Set<MovieList>()
    
    var movie: Movie
    var lists = [MovieList]()
    
    init(movie: Movie) {
        self.movie = movie
        fetchMovieLists()
        $text
            .map { $0.isEmpty}
            .assign(to: &$isDisabled)
    }
    
    
    func saveNote() {
        
    }
    
    func fetchMovieLists() {
        
    }
    
    func hasList(_ list: MovieList) -> Bool {
        selectedLists.contains(list)
    }
    
    func toggleList(_ list: MovieList) {
        if selectedLists.contains(list) {
            selectedLists.remove(list)
        } else {
            selectedLists.insert(list)
        }
    }
}


