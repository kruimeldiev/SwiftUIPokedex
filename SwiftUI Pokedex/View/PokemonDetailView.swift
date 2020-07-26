//
//  PokemonDetailView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 21/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var pokemonVM: PokemonViewModel
    
    var body: some View {
        
        VStack {
            
            HStack {
                SpriteView(pokemonSpriteURL: pokemonVM.sprites.front_default).frame(width: 150, height: 150)
                VStack (alignment: .leading) {
                    Text("#\(pokemonVM.id)")
                    Text(pokemonVM.name.capitalized)
                }
            }
            
            AboutPokemonView(pokemonVM: pokemonVM)
            
            Text(pokemonVM.specieFlavorTextZoeken())
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonVM: PokemonViewModel(pokemonURL: "", specieURL: ""))
    }
}
