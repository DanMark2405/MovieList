//
//  FilterViewModel.swift
//  MovieList
//
//  Created by Daniil Markish on 14.12.22.
//

import Foundation

class FilterModel {
    var minRate: Int = 0
    var maxRate: Int = 10
    var minDate = Date()
    var maxDate = Date()
}

class FilterViewModel: ObservableObject {
    
   // @Published var selectedGenres = Set<Genre>()
    @Published var minRate = 0
    @Published var maxRate = 10
//    @Published var minDate = Date()
//    @Published var maxDate = Date()
    //@Published var genres = [Genre]()
    var completion: ((FilterModel) -> Void)?
    
    init(model: FilterModel? = nil) {
       // fetchGenre()
        setup(model: model)
    }
    
    func setup(model: FilterModel?) {
        if let model = model {
            minRate = model.minRate
//            maxRate = model.maxRate
//            minDate = model.minDate
//            maxDate = model.maxDate
        }
    }
    
    func reset() {
        setup(model: FilterModel())
    }
    
    func apply() {
        let model = FilterModel()
        model.maxRate = maxRate
        model.minRate = minRate
//        model.minDate = minDate
//        model.maxDate = maxDate
        completion?(model)
    }
    
//    func fetchGenre() {
//        self.genres = PersistenceController.shared.fetchGenres()
//    }
//
//    func isSelectGenre(_ genre: Genre) -> Bool {
//        selectedGenres.contains(genre)
//    }
//
//    func toggleGenre(_ genre: Genre) {
//        if selectedGenres.contains(genre) {
//            selectedGenres.remove(genre)
//        } else {
//            selectedGenres.insert(genre)
//        }
//    }
    
}
