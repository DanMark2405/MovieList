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
        self.lists = [exMovieList, exMovieList, exMovieList]
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

var exNote: Note {
    var note = Note(context: PersistenceController.shared.viewContext)
    note.movie = exMovie
    note.rate = 9
    note.text = "asdasdasda"
    return note
}
var exMovieList: MovieList {
    var list = MovieList(context: PersistenceController.shared.viewContext)
    list.name = "first"
    list.userMovies.insert(exNote)
    list.userMovies.insert(exNote)
    list.userMovies.insert(exNote)
    return list
}
