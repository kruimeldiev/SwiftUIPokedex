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
    
    var pokemonURL: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                SpriteView(pokemonSpriteURL: "\(Constants.SPRITE_URL)\(self.viewModel.geselecteerdePokemon.id).png")
                    .frame(width: 150, height: 150)
                VStack (alignment: .leading) {
                    Text("#\(self.viewModel.geselecteerdePokemon.id)")
                    Text(self.viewModel.geselecteerdePokemon.name.capitalized)
                }
            }
            
            AboutPokemonView()
            
        }.onAppear {
            self.viewModel.netwokringManager.getSpecifiekePokemon(url: self.pokemonURL) { (Pokemon) in
                self.viewModel.geselecteerdePokemon = Pokemon
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonURL: "default")
    }
}
