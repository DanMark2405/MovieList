//
//  Extensions.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import Foundation
import UIKit

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

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
