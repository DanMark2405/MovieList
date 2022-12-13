//
//  MainView.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @Binding var isLogin: Bool
    var body: some View {
        TabView {
            MovieListView().tabItem {
                Image(systemName: "video.fill")
                Text("Movies")
            }
            CreateMovieView().tabItem {
                Image(systemName: "plus.circle")
                Text("Create Movie")
            }
            MovieListsView().tabItem {
                Image(systemName: "list.and.film" )
                Text("Movie Lists")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView( isLogin: .constant(true))
    }
}
