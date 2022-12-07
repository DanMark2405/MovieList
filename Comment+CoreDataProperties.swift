//
//  Comment+CoreDataProperties.swift
//  MovieList
//
//  Created by Daniil Markish on 6.12.22.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var text: String?
    @NSManaged public var rate: Double
    @NSManaged public var movie: Movie?
    @NSManaged public var user: User?

}

extension Comment : Identifiable {

}
