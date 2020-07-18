//
//  PokemonCardView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 19/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct PokemonCardView: View {
    
    var pokemonNaam: String
    var pokemonID: Int
    
    var body: some View {
        HStack {
            Text("\(pokemonID)")
            Text(pokemonNaam)
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemonNaam: "default", pokemonID: 0)
    }
}
