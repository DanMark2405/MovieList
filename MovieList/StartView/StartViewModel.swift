//
//  MainViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import Foundation

class StartViewModel: ObservableObject {
    @Published var isLogin = false
    
    init() {
        self.isLogin = !PersistenceController.shared.getUsers().isEmpty
    }
    
}
