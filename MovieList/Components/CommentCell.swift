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

var exComment: Comment {
    let comment = Comment(context: PersistenceController.shared.viewContext)
    comment.rate = 9
    comment.text = "comment asdas asd asds saf sf sd f sd f ds f  sd f  s f sd fsd f sdf    rafdfasfd adf asdf asdf"
    comment.user = exUser
    return comment
}
var exUser: User {
    let user = User(context: PersistenceController.shared.viewContext)
    user.lastName = "Daniil"
    user.firstName = "Markish"
    user.email = "emadsad@asdasd.com"
    user.movieLists.insert(exMovieList)
    user.movieLists.insert(exMovieList)
    user.movieLists.insert(exMovieList)
    user.movieLists.insert(exMovieList)
    return user
}
