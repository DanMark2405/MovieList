//
//  CreateMovieView.swift
//  MovieList
//
//  Created by Daniil Markish on 11.12.22.
//

import SwiftUI
import UIKit

struct CreateMovieView: View {
    
    @ObservedObject var viewModel: CreateMoviewViewModel
    @Environment(\.dismiss) var dismiss
    
    init(movie: Movie? = nil) {
        viewModel = CreateMoviewViewModel(movie: movie)
    }
    
    var gridItems = [GridItem(.adaptive(minimum: 20), spacing: 10)]
    var actorGridItems = [GridItem(.adaptive(minimum: 150), spacing: 10)]
    
    var body: some View {
        NavigationView() {
            ScrollView {
                Group {
                    TextFieldView(text: $viewModel.title, title: "Title")
                    
                    Text("Overview")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.purple)
                    TextEditor(text: $viewModel.overview)
                        .frame(minHeight: 200)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray.opacity(0.5), lineWidth: 1))
                    TextFieldView(text: $viewModel.posterPath, title: "Poster Path",keyboardType: .URL)
                    TextFieldView(text: $viewModel.voteAverage, title: "Vote Average",keyboardType: .decimalPad)
                    
                    Text("Release Date")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.purple)
                    DatePicker("Release Date", selection: $viewModel.date, displayedComponents: .date)
         
                    
                    genresView
                    actorsView
                    
                }.padding(.horizontal)
                
                Button(viewModel.buttonTitle) {
                    viewModel.create()
                    if viewModel.movie == nil {
                        viewModel.clean()
                    } else {
                        self.dismiss()
                    }
                    
                }
                .disabled(viewModel.isDisabled)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.purple)
                .cornerRadius(10)
                
                
            }.navigationTitle(viewModel.navTitle)
        }
    }
    
    var actorsView: some View {
        VStack {
            HStack {
                Text("Actors")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.purple)
                NavigationLink(destination: AddActorView(completion: viewModel.addActor(_:))) {
                    ZStack {
                        Circle()
                            .frame(width: 20)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                    }
                }
            }
            ScrollView(.horizontal) {
                LazyHGrid(rows: actorGridItems) {
                    ForEach(viewModel.actors.array()) { item in
                 ActorCell(actor: item)
                            .overlay(alignment: .topTrailing) {
                                Button(action: { viewModel.deleteActor(actor: item)}) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(width: 20)
                                        Image(systemName: "xmark.circle")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                    }
                    
                }
                .padding(.horizontal)
                
            }
        }
    }
    
    var genresView: some View {
        VStack {
            Text("Genres")
                .font(.title3)
                .bold()
                .foregroundColor(.purple)
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItems) {
                    ForEach(viewModel.genres) { genre in
                        Button(action: {
                            viewModel.toggleGenre(genre)}) {
                                Text(genre.name)
                                    .foregroundColor(.white)
                                    .padding(3)
                                    .background(RoundedRectangle(cornerRadius: 100).fill(viewModel.isSelectGenre(genre) ? .purple : .gray) )
                            }
                        
                    }
                    
                }.padding()
            }
           
            
        }
    }
}

struct CreateMovieView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMovieView()
    }
}
