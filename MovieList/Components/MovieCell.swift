//
//  MovieCell.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.posterPath), content: { image in
                image
                    .resizable()
            }, placeholder: {
                Image("moviePlaceholder")
                    .resizable()
                    .padding()
                    .background(Color.purple)
            })
            .frame(maxWidth: 150, maxHeight: 200)
            
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.title.bold())
                    .foregroundColor(.purple)
                HStack(spacing: 1) {
                    Text(String(format: "%.1f", movie.voteAverage))
                        .font(.title3)
                    Image(systemName: "star.fill")
                        .font(.title3)
                        .foregroundColor(.yellow)
                        .padding(.trailing)
                    Text(movie.releaseDate, style: .date)
                        .font(.title3)
                        .padding(3)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.purple.opacity(0.5)))
                }
                Text(movie.overview)
                    .font(.title3)
                    .foregroundColor(.gray)
                    .lineLimit(3)
                
            }
        }
        .padding([.top])
    }
}

struct MovieCell_Previews: PreviewProvider {

    static var previews: some View {
        MovieCell(movie: exMovie)
    }
}

var exMovie: Movie {
    var movie = Movie(context: PersistenceController.shared.viewContext)
    movie.title = "Django Unchained"
    movie.posterPath = "https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/fb91b40c-1158-4853-84c5-d587c53a9705/1920x"
    movie.overview = "https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/fb91b40c-1158-4853-84c5-d587c53a9705/1920x"
    movie.releaseDate = Date()
    movie.voteAverage = 9
   // movie.actors.insert(exActor)
    movie.comments.insert(exComment)
    return movie
}
