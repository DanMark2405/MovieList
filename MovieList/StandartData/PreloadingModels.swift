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

struct PreloadingMovie: Codable {
    let title: String
    let overview: String
    let voteAverage: Double
    let posterPath: String
    let releaseDate: String

}

struct PreloadingActor: Codable {
    let firstName: String
    let lastName: String
    let imagePath: String
}

