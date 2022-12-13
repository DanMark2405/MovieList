//
//  MovieList+CoreDataProperties.swift
//  MovieList
//
//  Created by Daniil Markish on 6.12.22.
//
//

import Foundation
import CoreData


extension MovieList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieList> {
        return NSFetchRequest<MovieList>(entityName: "MovieList")
    }

    @NSManaged public var name: String
    @NSManaged public var imagePath: String?
    @NSManaged public var userMovies: Set<Note>
    @NSManaged public var user: User?

}

// MARK: Generated accessors for userMovies
extension MovieList {

    @objc(addUserMoviesObject:)
    @NSManaged public func addToUserMovies(_ value: Note)

    @objc(removeUserMoviesObject:)
    @NSManaged public func removeFromUserMovies(_ value: Note)

    @objc(addUserMovies:)
    @NSManaged public func addToUserMovies(_ values: NSSet)

    @objc(removeUserMovies:)
    @NSManaged public func removeFromUserMovies(_ values: NSSet)

}

extension MovieList : Identifiable {

}
