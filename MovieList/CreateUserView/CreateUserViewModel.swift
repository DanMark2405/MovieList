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
    @Published var text = ""
    
    
    init() {
        Publishers.CombineLatest3($firstName, $lastName, $email)
            .map { (a, b, c) in
                return a.isEmpty || b.isEmpty || c.isEmpty
            }
            .print()
            .assign(to: &$isDisabled)
    }
    
    func createUser() {
        PersistenceController.shared.saveUser(name: firstName, surname: lastName, email: email)
    }
    
    func getUsers() {
        let array = PersistenceController.shared.getUsers()
        array.forEach { user in
            text += "\n \(user.firstName) \(user.lastName) \(user.email)"
        }
    }
    
}
