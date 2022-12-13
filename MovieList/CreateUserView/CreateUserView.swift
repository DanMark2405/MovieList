//
//  CreateUserView.swift
//  MovieList
//
//  Created by Daniil Markish on 7.12.22.
//

import SwiftUI

struct CreateUserView: View {
    @ObservedObject var viewModel = CreateUserViewModel()
    
    init(completion: @escaping (Bool) -> Void) {
        viewModel.completion = completion
    }
    var body: some View {
        VStack {
            Text("Create User")
                .font(.title.bold())
                .foregroundColor(.purple)
            Group {
                TextFieldView(text: $viewModel.firstName, title: "First name")
                TextFieldView(text: $viewModel.lastName, title: "Last name")
                TextFieldView(text: $viewModel.email, title: "Email")
            }.padding(.horizontal)
            
            Button("Create") {
                viewModel.createUser()
            }
            .disabled(viewModel.isDisabled)
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.purple)
                .cornerRadius(10)
        }
        
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView(completion: {_ in } )
    }
}
