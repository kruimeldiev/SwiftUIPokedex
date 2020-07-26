//
//  PokemonViewModel.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 24/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    @Published var pokemon: Pokemon
    
    init(url: String) {
        pokemon = Pokemon(height: 0, id: 0, name: "", weight: 0)
        pokemonLaden(url: url)
    }
    
//    var abilities: [Ability] {
//        return self.pokemon.abilities
//    }
    
    var height: Int {
        return self.pokemon.height
    }
    
    var id: Int {
        return self.pokemon.id
    }
    
    var name: String {
        return self.pokemon.name
    }
    
//    var species: SpeciesURL {
//        return self.pokemon.species
//    }
    
//    var sprites: Sprite {
//        return self.pokemon.sprites
//    }
    
//    var stats: [Stat] {
//        return self.pokemon.stats
//    }
    
//    var types: [Types] {
//        return self.pokemon.types
//    }
    
    var weight: Int {
        return self.pokemon.weight
    }
    
    func pokemonLaden(url: String) {
        
        NetworkingManager().getSpecifiekePokemon(url: url) { (pokemon) in
            self.pokemon = pokemon
        }
        
    }
    
}
