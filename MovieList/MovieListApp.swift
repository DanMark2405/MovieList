//
//  MovieListApp.swift
//  MovieList
//
//  Created by Daniil Markish on 6.12.22.
//

import SwiftUI

@main
struct MovieListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
         AddActorView()
        }
    }
}
