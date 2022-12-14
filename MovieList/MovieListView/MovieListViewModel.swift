//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 11.12.22.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var searchText = ""
    
    var filter: FilterModel?
    
    var persistance = PersistenceController.shared
    init() {
    
    }
    
    func filter(filter: FilterModel) {
        self.filter = filter
        fetchMovies()
    }
    
    func search() {
        fetchMovies()
    }
    
    func fetchMovies() {
//        let minDate = filter?.minDate.formatted(date: .numeric, time: .omitted) == Date().formatted(date: .numeric, time: .omitted) ? nil : filter?.minDate
//        let maxDate = filter?.maxDate.formatted(date: .numeric, time: .omitted) == Date().formatted(date: .numeric, time: .omitted) ? nil : filter?.maxDate
        movies = persistance.fetchMovies(
        searchText: searchText,
        minRate: filter?.minRate ?? 0,
        maxRate: filter?.maxRate ?? 10
        )
    }
    
    func deleteMovie(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }
        let movie = movies[index]
        persistance.viewContext.delete(movie)
        persistance.saveContext()
    }
    
    func updateView(){
          self.objectWillChange.send()
      }
    
    
}
