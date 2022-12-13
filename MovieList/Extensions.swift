//
//  Extensions.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import Foundation

extension Date {
    func year() -> String {
        let date = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        return yearString
        
    }
}

extension Set {
    func array() -> [Element] {
        return Array(self)
    }
}

