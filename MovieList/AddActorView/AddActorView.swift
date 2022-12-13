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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add Actor")
                .font(.title.bold())
                .foregroundColor(.purple)
                .padding(.horizontal)
            
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
                    }
                    .disabled(viewModel.isDisabled)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.purple)
                    .cornerRadius(10)
                }.padding(8)
              
                
            }
            
            LazyVGrid(columns: gridItems) {
                ForEach(viewModel.actors) { item in
                    ActorCell(actor: item)
                }
            }
           

        }
    }
}

struct AddActorView_Previews: PreviewProvider {
    static var previews: some View {
        AddActorView()
    }
}






