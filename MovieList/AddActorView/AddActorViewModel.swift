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
   
    init() {
        actors = [exActor, exActor, exActor, exActor]
        Publishers.CombineLatest3($firstName, $lastName, $imagePath)
            .map { (a, b, c) in
                return a.isEmpty || b.isEmpty || c.isEmpty
            }
            .print()
            .assign(to: &$isDisabled)
    }
    
    func addActor() {
        
    }
    
}
