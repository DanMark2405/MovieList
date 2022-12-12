//
//  Actor+CoreDataProperties.swift
//  MovieList
//
//  Created by Daniil Markish on 6.12.22.
//
//

import Foundation
import CoreData


extension Actor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Actor> {
        return NSFetchRequest<Actor>(entityName: "Actor")
    }

    @NSManaged public var firstName: String
    @NSManaged public var imagePath: String
    @NSManaged public var lastName: String
    @NSManaged public var movies: Movie?

}

extension Actor : Identifiable {

}
