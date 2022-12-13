//
//  Note+CoreDataProperties.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var text: String
    @NSManaged public var rate: Int
    @NSManaged public var movie: Movie
    @NSManaged public var movieLists: NSSet?

}

// MARK: Generated accessors for movieLists
extension Note {

    @objc(addMovieListsObject:)
    @NSManaged public func addToMovieLists(_ value: MovieList)

    @objc(removeMovieListsObject:)
    @NSManaged public func removeFromMovieLists(_ value: MovieList)

    @objc(addMovieLists:)
    @NSManaged public func addToMovieLists(_ values: NSSet)

    @objc(removeMovieLists:)
    @NSManaged public func removeFromMovieLists(_ values: NSSet)

}

extension Note : Identifiable {

}
