//
//  AddActorViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import Foundation
import Combine

class AddActorViewModel: ObservableObject {
    @Published var actors = [Actor]()
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var imagePath = ""
    @Published var isDisabled = false
    @Published var searchText = ""
   
    var dataBase = PersistenceController.shared
    var completion: ((Actor) -> Void)?
    
    init() {
        Publishers.CombineLatest3($firstName, $lastName, $imagePath)
            .map { (a, b, c) in
                return a.isEmpty || b.isEmpty || c.isEmpty
            }
            .print()
            .assign(to: &$isDisabled)
    }
    
    func addActor() {
        let actor = Actor(context: dataBase.viewContext)
        actor.firstName = firstName
        actor.lastName = lastName
        actor.imagePath = imagePath
        dataBase.saveContext()
        completion?(actor)
    }
    
    func fetch(searchText: String = "") {
        self.actors = dataBase.fetchActors(searchText: searchText)
    }
    
    func search() {
        fetch(searchText: searchText)
    }
    
}
