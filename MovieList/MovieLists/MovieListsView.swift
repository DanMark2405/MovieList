//
//  MovieLists.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import SwiftUI

struct MovieListsView: View {
    @ObservedObject var viewModel = MovieListsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 80, height: 100)
                    Group {
                        Text(viewModel.user.firstName) +
                        Text(" ") +
                        Text(viewModel.user.lastName)
                    }.font(.title2.bold())
                    
                    Text(viewModel.user.email)
                        .foregroundColor(.gray)
                    
                }
    
                LazyVStack(alignment: .leading) {
                    HStack(alignment: .bottom ) {
                        TextFieldView(text: $viewModel.name, title: "New List")
                        Button("Save") {
                            viewModel.addNewList()
                        }
                        .disabled(viewModel.isDisabled)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.purple)
                        .cornerRadius(10)
                    }.padding(.horizontal)
                    
                    ForEach(viewModel.user.movieLists.array()) { list in
                        Text(list.name)
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        
                        Divider()
                    }
                }
            }.navigationTitle("Movie lists")
        }
    }
}

struct MovieLists_Previews: PreviewProvider {
    static var previews: some View {
        MovieListsView()
    }
}
