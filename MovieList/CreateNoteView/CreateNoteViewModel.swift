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
    var note: UserMovie?
    var lists = [MovieList]()
    var database = PersistenceController.shared
    
    var navTitle = "Create Note"
    var buttonTitle = "Create"
    
    init(movie: Movie) {
        self.movie = movie
        fetchMovieLists()
        $text
            .map { $0.isEmpty}
            .assign(to: &$isDisabled)
    }
    
    convenience init(userMovie: UserMovie) {
        self.init(movie: userMovie.movie)
        self.note = userMovie
        navTitle = "Edit Note"
        buttonTitle = "Edit"
        
        self.rate = userMovie.rate
        self.text = userMovie.text
        self.selectedLists = userMovie.movieLists
        
    }
    
    
    func saveNote() {
        var userMovie: UserMovie
        if let note = note {
            userMovie = note
        } else {
             userMovie = UserMovie(context: database.viewContext)
        }
        userMovie.rate = rate
        userMovie.text = text
        userMovie.movie = movie
        userMovie.movieLists = selectedLists
        if let list = lists.first(where: { $0.name == "My Notes"}) {
            userMovie.movieLists.insert(list)
        }
        database.saveContext()
    }
    
    func fetchMovieLists() {
        self.lists = database.fetchMovieLists()
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


