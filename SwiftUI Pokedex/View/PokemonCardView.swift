//
//  PokemonCardView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 19/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct PokemonCardView: View {
    
    var pokemon: PokedexEntryViewModel
    var pokemonID: Int
    
    var body: some View {
        
        HStack {
            
            Text("#\(self.pokemonID)")
            Text(self.pokemon.name.capitalized)
            Spacer()
            SpriteView(pokemonSpriteURL: "\(Constants.SPRITE_URL)\(pokemonID).png").frame(width: 40, height: 40)
            
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: PokedexEntryViewModel(entry: PokedexEntry(name: "", url: "")), pokemonID: 0)
    }
}
