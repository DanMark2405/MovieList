//
//  MovieDetail.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    @State var isShow = false
    init(movie: Movie) {
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
                }
                .padding(.leading)
                Text(viewModel.movie.releaseDate.year())
                    .font(.title)
                    .padding(3)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.purple.opacity(0.5)))
                    .padding(.leading)
                Text(viewModel.movie.overview)
                    .padding(.horizontal)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                ScrollView(.horizontal) {
                    ForEach(viewModel.movie.actors.array()) { item in
                        ActorCell(actor: item)
                    }
                }.frame(height: 250)
                    .padding(.horizontal)
                
                VStack {
                    Button("Add comment + ") {
                        isShow.toggle()
                    }
                    .foregroundColor(.purple)
                    if isShow {
                        VStack {
                            HStack {
                                Stepper(value: $viewModel.rate, in: 1...10) {
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .font(.title.bold())
                                            .foregroundColor(.yellow)
                                            .padding(.trailing)
                                        Text("\(viewModel.rate)")
                                            .font(.title.bold())
                                            .foregroundColor(.purple)
                                    }
                                }.frame(width: 200)
                                Button("Save") {
                                    viewModel.addComment()
                                }
                                .disabled(viewModel.isDisabled)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(Color.purple)
                                .cornerRadius(10)
                            }
                           
                            TextEditor(text: $viewModel.commentText)
                                .frame(minHeight: 200)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray.opacity(0.5), lineWidth: 1))
                        }.padding(.horizontal)
                    }
                    LazyVStack(alignment: .leading ) {
                        ForEach(viewModel.movie.comments.array()) {comment in
                            CommentCell(comment: comment)
                            
                        }
                    }.padding(.horizontal)
        
                }
            }
            .onAppear {
                viewModel.updateView()
            }
            .ignoresSafeArea()
                .navigationTitle(viewModel.movie.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 0) {
                            Button(action: {}) {
                                ZStack {
                                    Circle()
                                        .frame(width: 40)
                                        .foregroundColor(.pink.opacity(0.5))
                                    Image(systemName: "plus")
                                        .font(.title3.bold())
                                        .foregroundColor(.white)
                                }
                            }
                            NavigationLink(destination: CreateMovieView(movie: viewModel.movie)) {
                                    ZStack {
                                        Circle()
                                            .frame(width: 40)
                                            .foregroundColor(.blue.opacity(0.5))
                                        Image(systemName: "pencil")
                                            .font(.title3.bold())
                                            .foregroundColor(.white)
                                    }
                            }
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
