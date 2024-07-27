//
//  CircleImage.swift
//  pokedex-swiftuf
//
//  Created by Alejandro Mendoza on 26/07/24.
//

import SwiftUI

struct CircleImage: View {
    let pokemon: Pokemon
    
    private var imageURL: URL? {
        URL(string: pokemon.imageURL)
    }

    var body: some View {
        if let imageURL {
            AsyncImage(url: imageURL,
                       content: { image in
                image
                    //.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color.yellow,
                                    lineWidth: 5)
                    }
                    .shadow(radius: 10)
                    .frame(width: 250, height: 250)
                
            }, placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            })
        }
    }
}

#Preview {
    CircleImage(pokemon: pokedex[0])
}
