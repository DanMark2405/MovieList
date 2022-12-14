//
//  MovieListView.swift
//  MovieList
//
//  Created by Daniil Markish on 11.12.22.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieCell(movie: movie)
                            
                        }
                        .listRowSeparator(.hidden)
                        
                    }.onDelete(perform: viewModel.deleteMovie(at:))
                }
                .listStyle(.inset)
            }
            .onAppear {
                viewModel.fetchMovies()
                viewModel.updateView()
            }.navigationTitle("Movies")
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
