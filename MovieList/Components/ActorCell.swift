//
//  ActorCell.swift
//  MovieList
//
//  Created by Daniil Markish on 12.12.22.
//

import SwiftUI

struct ActorCell: View {
    var actor: Actor
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: actor.imagePath), content: { image in
                image
                    .resizable()
            }, placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .padding()
                    .background(Color.purple)
            })
            .frame(width: 120, height: 150)
            Text("\(actor.firstName) \n \(actor.lastName)" )
                .font(.title2.bold())
                .foregroundColor(.purple)
        }
    }
}

struct ActorCell_Previews: PreviewProvider {
    static var previews: some View {
        ActorCell(actor: exActor)
    }
}

var exActor: Actor {
    let actor = Actor(context: PersistenceController.shared.viewContext)
    actor.lastName = "Waltz"
    actor.firstName = "Christoph"
    actor.imagePath = "https://www.film.ru/sites/default/files/people/1480482-1171500.jpg"
    return actor
}
