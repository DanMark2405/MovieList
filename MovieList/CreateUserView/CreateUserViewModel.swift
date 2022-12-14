//
//  CreateUserViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 7.12.22.
//

import Foundation
import Combine

class CreateUserViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var isDisabled = true
    var completion: ((Bool) -> Void)?
    
    init() {
        Publishers.CombineLatest3($firstName, $lastName, $email)
            .map { (a, b, c) in
                return a.isEmpty || b.isEmpty || c.isEmpty
            }
            .print()
            .assign(to: &$isDisabled)
    }
    
    func createUser() {
        let user = User(context: PersistenceController.shared.viewContext)
        user.lastName = lastName
        user.firstName = firstName
        user.email = email
        
        let list1 = MovieList(context: PersistenceController.shared.viewContext)
        list1.name = "Favorite"
        list1.user = user
        user.movieLists.insert(list1)
        
        let list2 = MovieList(context: PersistenceController.shared.viewContext)
        list2.name = "My Notes"
        list2.user = user
        user.movieLists.insert(list2)
        
        let list3 = MovieList(context: PersistenceController.shared.viewContext)
        list3.name = "Watched"
        list3.user = user
        user.movieLists.insert(list3)
        
        PersistenceController.shared.saveContext()
        completion?(true)
    }
    
    
}
