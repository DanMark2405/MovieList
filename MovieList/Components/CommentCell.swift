//
//  CommentCell.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import SwiftUI

struct CommentCell: View {
    var comment: Comment
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "person")
                    .font(.largeTitle.bold())
                Text(comment.user?.firstName ?? "")
                    .foregroundColor(.purple)
                Text(comment.user?.lastName ?? "")
                    .foregroundColor(.purple)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(String(format: "%.1f", comment.rate))
                        .font(.title3)
                    Image(systemName: "star.fill")
                        .font(.title3)
                        .foregroundColor(.yellow)
                        .padding(.trailing)
                }
                Text(comment.text ?? "")
                    .foregroundColor(.gray)
            }
            
        }
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell(comment: exComment)
    }
}


