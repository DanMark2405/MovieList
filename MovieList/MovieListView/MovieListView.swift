//
//  MovieListView.swift
//  MovieList
//
//  Created by Daniil Markish on 11.12.22.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    @State var isShowFilter = false
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 0) {
                    Button("Filter") {
                        isShowFilter.toggle()
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.purple)
                        .cornerRadius(10)
                        .padding(.leading)
                    SearchView(text: $viewModel.searchText, action: viewModel.search)
                }
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
          
            }.navigationTitle("Movies")
                .sheet(isPresented: $isShowFilter) {
                    FilterView(model: viewModel.filter, completion: viewModel.filter(filter:))
                }
                .onAppear {
                    viewModel.fetchMovies()
                    viewModel.updateView()
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
