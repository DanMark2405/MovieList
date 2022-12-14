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
    @Published var rate = 1
    @Published var isDisabled = false
    
    private var  database = PersistenceController.shared
    init(movie: Movie) {
        self.movie = movie
        $commentText
            .map { $0.isEmpty}
            .assign(to: &$isDisabled)
        
    }
    
    func addComment() {
        guard let user = database.getUsers().first else {
            return
        }
        
        let comment = Comment(context: database.viewContext)
        comment.text = commentText
        comment.rate = rate
        comment.movie = movie
        comment.user = user
        database.saveContext()
        updateView()
    }
    
    func deleteMovie() {
        database.viewContext.delete(movie)
    }
    
    func updateView(){
          self.objectWillChange.send()
      }
    
    
}
