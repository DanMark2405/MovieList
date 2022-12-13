//
//  MainView.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel = StartViewModel()
    var body: some View {
        if viewModel.isLogin {
            MainView(isLogin: $viewModel.isLogin)
        } else {
            CreateUserView(completion: { isLogin in
                viewModel.isLogin = isLogin
            })
        }
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
