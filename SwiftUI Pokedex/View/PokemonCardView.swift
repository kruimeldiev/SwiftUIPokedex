//
//  PokemonCardView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 19/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct PokemonCardView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var pokemonNaam: String
    var pokemonID: Int
    
    var body: some View {
        HStack {
            Text("#\(pokemonID).")
            Text(pokemonNaam)
            Spacer()
            SpriteView(pokemonSpriteURL: "\(Constants.SPRITE_URL)\(pokemonID).png")
                .frame(width: 50, height: 50)
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemonNaam: "default", pokemonID: 1)
    }
}
