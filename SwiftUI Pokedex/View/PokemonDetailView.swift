//
//  PokemonDetailView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 21/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var pokemonURL: String
    @State var weergegevenPokemon: Pokemon
    
    var body: some View {
        VStack {
            SpriteView(pokemonSpriteURL: "\(Constants.SPRITE_URL)\(self.weergegevenPokemon.id).png")
                .frame(width: 100, height: 100)
            Text(self.weergegevenPokemon.name.capitalized)
            Text("Height: \(self.weergegevenPokemon.height * 10) cm")
            Text("Weight: \(self.weergegevenPokemon.weight / 10) kg")
            ForEach(0..<self.weergegevenPokemon.types.count, id: \.self) { type in
                TypeView(type: self.weergegevenPokemon.types[type].type)
            }
        }.onAppear {
                self.viewModel.netwokringManager.getSpecifiekePokemon(url: self.pokemonURL) { (Pokemon) in
                    self.weergegevenPokemon = Pokemon
                }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonURL: "default", weergegevenPokemon: Pokemon(height: 0, id: 0, name: "default", sprites: Sprite(front_default: "default"),types: [], weight: 0))
    }
}
