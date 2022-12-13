//
//  User+CoreDataProperties.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String
    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var comments: NSSet?
    @NSManaged public var movieLists: Set<MovieList>

}

// MARK: Generated accessors for comments
extension User {

    @objc(addCommentsObject:)
    @NSManaged public func addToComments(_ value: Comment)

    @objc(removeCommentsObject:)
    @NSManaged public func removeFromComments(_ value: Comment)

    @objc(addComments:)
    @NSManaged public func addToComments(_ values: NSSet)

    @objc(removeComments:)
    @NSManaged public func removeFromComments(_ values: NSSet)

}

// MARK: Generated accessors for movieLists
extension User {

    @objc(addMovieListsObject:)
    @NSManaged public func addToMovieLists(_ value: MovieList)

    @objc(removeMovieListsObject:)
    @NSManaged public func removeFromMovieLists(_ value: MovieList)

    @objc(addMovieLists:)
    @NSManaged public func addToMovieLists(_ values: NSSet)

    @objc(removeMovieLists:)
    @NSManaged public func removeFromMovieLists(_ values: NSSet)

}

extension User : Identifiable {

}
