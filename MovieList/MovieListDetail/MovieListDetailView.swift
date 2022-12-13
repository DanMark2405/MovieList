//
//  MovieListDetailView.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import SwiftUI

struct MovieListDetailView: View {
    @ObservedObject var viewModel: MovieListDetailViewModel
    
    init(movieList: MovieList) {
        self.viewModel = MovieListDetailViewModel(movieList: movieList)
    }
    var body: some View {
        ScrollView {
            Text(viewModel.name)
                .font(.title.bold())
                .foregroundColor(.purple)
            
            HStack {
                TextField("name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
                .font(.title3)
                Button("Edit") {
                    
                }
                .disabled(viewModel.isDisabled)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.purple)
                .cornerRadius(10)
            }.padding(.horizontal)
            
            LazyVStack {
                ForEach(viewModel.movieList.userMovies.array()) { note in
                    VStack(alignment: .leading) {
                        MovieCell(movie: note.movie)
                        HStack {
                            Image(systemName: "star.fill")
                                .font(.title.bold())
                                .foregroundColor(.yellow)
                                .padding(.trailing)
                            Text("\(note.rate)")
                                .font(.title.bold())
                                .foregroundColor(.purple)
                        }
                        Text(note.text)
                            .foregroundColor(.gray)
                            .lineLimit(3)
                    }
                    
                }
            }
            
        }
    }
}

struct MovieListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListDetailView(movieList: exMovieList)
    }
}
