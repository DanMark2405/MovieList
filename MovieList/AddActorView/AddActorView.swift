//
//  AddActorView.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import SwiftUI

struct AddActorView: View {
    
    @ObservedObject var viewModel = AddActorViewModel()
    @State private var isShow = false
    var gridItems = [GridItem(.adaptive(minimum: 100), spacing: 10)]
    
    @Environment(\.dismiss) var dismiss
    
    init(completion: @escaping (Actor) -> Void) {
        viewModel.completion = completion
    }
    
    var body: some View {
        VStack(alignment: .leading) {
      
            SearchView(text: $viewModel.searchText) {
                viewModel.search()
            }
            Button("Add new actor +") {
                isShow.toggle()
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            if isShow {
                VStack {
                    HStack {
                        TextFieldView(text: $viewModel.firstName, title: "First name")
                        TextFieldView(text: $viewModel.lastName, title: "Last name")
                    }
                    TextFieldView(text: $viewModel.imagePath, title: "Image path", keyboardType: .URL)
                    Button("Create") {
                        viewModel.addActor()
                        self.dismiss()
                    }
                    .disabled(viewModel.isDisabled)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.purple)
                    .cornerRadius(10)
                }.padding(8)
              
                
            }
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(viewModel.actors) { item in
                        Button(action: {
                            viewModel.completion?(item)
                            self.dismiss()
                        }) {
                            ActorCell(actor: item)
                        }
                        
                    }
                }
            }
            Spacer()
           

        }.navigationTitle("Add Actor")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetch()
            }
            
    }
}

struct AddActorView_Previews: PreviewProvider {
    static var previews: some View {
        AddActorView(completion: { _ in})
    }
}






