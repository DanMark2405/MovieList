//
//  MovieListsViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import Foundation
import Combine
class MovieListsViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var isDisabled = false
    
    var database = PersistenceController.shared
    var user: User
    
    init() {
        user = database.getUsers().first ?? User(context: database.viewContext)
        $name
            .map {$0.isEmpty}
            .assign(to: &$isDisabled)
        
    }
    
    func getUser() {
        user = database.getUsers().first ?? User(context: database.viewContext)
    }
    
    func addNewList() {
        let list = MovieList(context: database.viewContext)
        list.name = name
        list.user = user
        database.saveContext()
        name = ""
    }
    
    func updateView(){
          self.objectWillChange.send()
      }
}
