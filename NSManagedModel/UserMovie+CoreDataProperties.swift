//
//  UserMovie+CoreDataProperties.swift
//  MovieList
//
//  Created by Daniil Markish on 6.12.22.
//
//

import Foundation
import CoreData


extension UserMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserMovie> {
        return NSFetchRequest<UserMovie>(entityName: "UserMovie")
    }

    @NSManaged public var note: String?
    @NSManaged public var rate: Double
    @NSManaged public var movie: Movie?
    @NSManaged public var movieLists: NSSet?

}

// MARK: Generated accessors for movieLists
extension UserMovie {

    @objc(addMovieListsObject:)
    @NSManaged public func addToMovieLists(_ value: MovieList)

    @objc(removeMovieListsObject:)
    @NSManaged public func removeFromMovieLists(_ value: MovieList)

    @objc(addMovieLists:)
    @NSManaged public func addToMovieLists(_ values: NSSet)

    @objc(removeMovieLists:)
    @NSManaged public func removeFromMovieLists(_ values: NSSet)

}

extension UserMovie : Identifiable {

}
