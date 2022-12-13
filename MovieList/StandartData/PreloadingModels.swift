//
//  PreloadingModels.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import Foundation

struct PreloadingGenre: Codable {
    let id: Int
    let name: String
}

struct PreloadingGenreData: Codable {
    let genres: [PreloadingGenre]
}
