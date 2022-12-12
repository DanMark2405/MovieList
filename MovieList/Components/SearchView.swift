//
//  SearchView.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    var title: String = "Search..."
    var action: () -> Void
    var body: some View {
        HStack {
            TextField(title, text: $text)
                .textFieldStyle(.roundedBorder)
                .font(.title3)
            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .font(.title.bold())
                    .foregroundColor(.purple)
            }
        
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""), action: {})
    }
}
