//
//  MovieDetail.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import SwiftUI

struct MovieDetailView: View {
    var viewModel: MovieDetailViewModel
    
    init(movie: Movie) {
        let movie = exMovie
        self.viewModel = MovieDetailViewModel(movie: movie)
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: viewModel.movie.posterPath), content: { image in
                    image
                        .resizable()
                }, placeholder: {
                    Image("moviePlaceholder")
                        .resizable()
                        .padding()
                        .background(Color.purple)
                })
                .frame(maxHeight: 400)

                Text(viewModel.movie.title)
                    .font(.title.bold())
                    .foregroundColor(.purple)
                    .padding(.leading)
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                        .font(.title.bold())
                        .foregroundColor(.yellow)
                        .padding(.trailing, 6)
                    Text(String(format: "%.1f", viewModel.movie.voteAverage))
                        .font(.title.bold())
                        .foregroundColor(.purple)
                    Text("(\(viewModel.movie.voteCount))")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                .padding(.leading)
                Text(viewModel.movie.releaseDate.year())
                    .font(.title)
                    .padding(3)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.purple.opacity(0.5)))
                    .padding(.leading)
                Text(viewModel.movie.overview)
                    .padding([.leading, .trailing])
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    Spacer()
                }
                Spacer()
            }
        }.ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        ZStack {
                            Circle()
                                .frame(width: 60)
                                .foregroundColor(.pink.opacity(0.5))
                            Image(systemName: "plus")
                                .font(.title.bold())
                                .foregroundColor(.white)
                        }
                    }
                }
            }
    }
    
    
}


struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: exMovie)
    }
}
