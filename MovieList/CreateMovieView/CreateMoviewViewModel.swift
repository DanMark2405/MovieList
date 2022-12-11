//
//  CreateMoviewViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 11.12.22.
//

import Foundation
import Combine

class CreateMoviewViewModel: ObservableObject {
    
    
    @Published var title = ""
    @Published var overview = ""
    @Published var posterPath = ""
    @Published var voteCount = ""
    @Published var voteAverage = ""
    @Published var date = Date()
    
    @Published var isDisabled = true
    @Published var text = ""
    
    var persistance = PersistenceController.shared
    init() {

        Publishers.CombineLatest3($title, $overview, $posterPath)
            .map { (a, b, c) in
                return a.isEmpty || b.isEmpty || c.isEmpty
            }
            .print()
            .assign(to: &$isDisabled)
    }
    
    func create() {
        let movie = Movie(context: persistance.viewContext)
        movie.title = title
        movie.overview = overview
        movie.posterPath = posterPath
        movie.voteCount = Int(voteCount) ?? 0
        movie.voteAverage = Double(voteAverage) ?? 0
        movie.releaseDate = date
        persistance.saveContext()
    }
    
    func getMovie() {
        let requset = Movie.fetchRequest()
        let movies = try? persistance.viewContext.fetch(requset)
        guard let movie = movies?.first else { return  }
       text = " \(movie.title) \(movie.overview) \(movie.posterPath) \(movie.voteCount) \(movie.voteAverage )  \(movie.releaseDate)"
    }
    
}
