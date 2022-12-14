//
//  CreateNoteViewView.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import SwiftUI

struct CreateNoteView: View {
    @ObservedObject var viewModel: CreateNoteViewModel
    @Environment(\.dismiss) var dismiss
    
    init(movie: Movie) {
        self.viewModel = CreateNoteViewModel(movie: movie)
    }
    
    init(note: UserMovie) {
        self.viewModel = CreateNoteViewModel(userMovie: note)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
    
                    MovieCell(movie: viewModel.movie)
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
                        
                    }
                    Text("Comment")
                        .font(.title.bold())
                        .foregroundColor(.purple)
                    
                    TextEditor(text: $viewModel.text)
                        .frame(minHeight: 200)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray.opacity(0.5), lineWidth: 1))
                    
                    Text("Movie lists")
                        .font(.title.bold())
                        .foregroundColor(.purple)
                    
                    LazyVStack() {
                        ForEach(viewModel.lists) { list in
                            VStack(alignment: .leading, spacing: 0) {
                                    Button(action: {
                                        viewModel.toggleList(list)
                                    }) {
                                        HStack {
                                            Text(list.name)
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                        .background( viewModel.hasList(list) ? .purple : .gray  )
                                    }.padding(.horizontal)
                                
                                Spacer()
                                    .frame(height: 3)
                            }
                        }
                    }
                    
                    
                    Button(viewModel.buttonTitle) {
                        viewModel.saveNote()
                        self.dismiss()
                    }
                    .disabled(viewModel.isDisabled)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.purple)
                    .cornerRadius(10)
                }.padding(.horizontal)
            }
            .navigationTitle(viewModel.navTitle)
        }
        
    }
}

struct CreateNoteViewView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView(movie: exMovie)
    }
}
