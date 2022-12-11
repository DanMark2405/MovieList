//
//  CreateMovieView.swift
//  MovieList
//
//  Created by Daniil Markish on 11.12.22.
//

import SwiftUI

struct CreateMovieView: View {
    @ObservedObject var viewModel = CreateMoviewViewModel()
    var body: some View {
        ScrollView {
            Text("Create Movie")
                .font(.title.bold())
                .foregroundColor(.purple)
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
                TextFieldView(text: $viewModel.voteCount, title: "Vote Count", keyboardType: .numberPad)
                TextFieldView(text: $viewModel.voteAverage, title: "Vote Average",keyboardType: .decimalPad)
                
                Text("Release Date")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.purple)
                DatePicker("Release Date", selection: $viewModel.date, displayedComponents: .date)
                
                
            }.padding(.horizontal)
            
            Button("Create") {
                viewModel.create()
            }
            .disabled(viewModel.isDisabled)
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.purple)
            .cornerRadius(10)
            
            Button("Get") {
                viewModel.getMovie()
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.purple)
            .cornerRadius(10)
             Text(viewModel.text)
        }
    }
}

struct CreateMovieView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMovieView()
    }
}
