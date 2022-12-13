//
//  Examples.swift
//  MovieList
//
//  Created by Daniil Markish on 13.12.22.
//

import Foundation

var exNote: UserMovie {
    var note = UserMovie(context: PersistenceController.shared.viewContext)
    note.movie = exMovie
    note.rate = 9
    note.text = "asdasdasda"
    return note
}
var exMovieList: MovieList {
    var list = MovieList(context: PersistenceController.shared.viewContext)
    list.name = "first"
    list.userMovies.insert(exNote)
    list.userMovies.insert(exNote)
    list.userMovies.insert(exNote)
    return list
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
