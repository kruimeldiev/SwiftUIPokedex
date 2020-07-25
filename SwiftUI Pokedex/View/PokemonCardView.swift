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
            
            Text(self.pokemon.name.capitalized)
            
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: PokedexEntryViewModel(entry: PokedexEntry(name: "", url: "")), pokemonID: 0)
    }
}
