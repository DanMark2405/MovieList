//
//  Movie+CoreDataProperties.swift
//  MovieList
//
//  Created by Daniil Markish on 6.12.22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var posterPath: String
    @NSManaged public var overview: String
    @NSManaged public var releaseDate: Date
    @NSManaged public var title: String
    @NSManaged public var voteAverage: Double
    @NSManaged public var voteCount: Int64
    @NSManaged public var actors: Set<Actor>
    @NSManaged public var genres: Set<Genre>
    @NSManaged public var comments: Set<Comment>

}

// MARK: Generated accessors for actors
extension Movie {

    @objc(addActorsObject:)
    @NSManaged public func addToActors(_ value: Actor)

    @objc(removeActorsObject:)
    @NSManaged public func removeFromActors(_ value: Actor)

    @objc(addActors:)
    @NSManaged public func addToActors(_ values: NSSet)

    @objc(removeActors:)
    @NSManaged public func removeFromActors(_ values: NSSet)

}

// MARK: Generated accessors for genres
extension Movie {

    @objc(addGenresObject:)
    @NSManaged public func addToGenres(_ value: Genre)

    @objc(removeGenresObject:)
    @NSManaged public func removeFromGenres(_ value: Genre)

    @objc(addGenres:)
    @NSManaged public func addToGenres(_ values: NSSet)

    @objc(removeGenres:)
    @NSManaged public func removeFromGenres(_ values: NSSet)

}

// MARK: Generated accessors for comments
extension Movie {

    @objc(addCommentsObject:)
    @NSManaged public func addToComments(_ value: Comment)

    @objc(removeCommentsObject:)
    @NSManaged public func removeFromComments(_ value: Comment)

    @objc(addComments:)
    @NSManaged public func addToComments(_ values: NSSet)

    @objc(removeComments:)
    @NSManaged public func removeFromComments(_ values: NSSet)

}

extension Movie : Identifiable {

}
