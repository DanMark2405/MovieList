//
//  FilterView.swift
//  MovieList
//
//  Created by Daniil Markish on 14.12.22.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var viewModel: FilterViewModel
    @Environment(\.dismiss) var dismiss
    
    init(model: FilterModel? = nil, completion: @escaping (FilterModel) -> Void) {
        viewModel = FilterViewModel(model: model)
        viewModel.completion = completion
    }
    
    var gridItems = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10),GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        VStack {
            Text("Filters")
                .foregroundColor(.purple)
                .font(.title.bold())
//            Text("Genres")
//                .foregroundColor(.pink)
//                .font(.title2.bold())
//
//                LazyVGrid(columns: gridItems) {
//                    ForEach(viewModel.genres) { genre in
//                        Button(action: {
//                            viewModel.toggleGenre(genre)}) {
//                                Text(genre.name)
//                                    .foregroundColor(.white)
//                                    .padding(8)
//                                    .background(RoundedRectangle(cornerRadius: 100).fill(viewModel.isSelectGenre(genre) ? .purple : .gray) )
//                            }
//
//
//                    }
//                }
                
            Stepper("Min rate: \(viewModel.minRate)", value: $viewModel.minRate, in: 1...10)
            Stepper("Max rate: \(viewModel.maxRate)", value: $viewModel.maxRate, in: 1...10)
      
            Button("Reset") {
                viewModel.reset()
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.purple)
                .cornerRadius(10)
            Button("Apply") {
                viewModel.apply()
                self.dismiss()
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.purple)
                .cornerRadius(10)
            
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(completion: { _ in })
    }
}


