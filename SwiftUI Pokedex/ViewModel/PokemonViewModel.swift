//
//  PokemonViewModel.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 24/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    @Published var pokemon = Pokemon(abilities: [],
                                     height: 0,
                                     id: 0,
                                     name: "",
                                     species: SpeciesURL(url: ""),
                                     sprites: Sprite(front_default: ""),
                                     stats: [],
                                     types: [],
                                     weight: 0)
    
    // De init zorgt ervoor dat de juiste pokemon data wordt gebruikt wanneer de PokemonViewModel wordt aangeroepen
    init(url: String) {
        pokemonLaden(url: url)
    }
    
    var abilities: [Ability] {
        return self.pokemon.abilities
    }
    
    var height: Int {
        return self.pokemon.height
    }
    
    var id: Int {
        return self.pokemon.id
    }
    
    var name: String {
        return self.pokemon.name
    }
    
    var species: SpeciesURL {
        return self.pokemon.species
    }
    
    var sprites: Sprite {
        return self.pokemon.sprites
    }
    
    var stats: [Stat] {
        return self.pokemon.stats
    }
    
    var types: [Types] {
        return self.pokemon.types
    }
    
    var weight: Int {
        return self.pokemon.weight
    }
    
    // Deze functie roept de NetworkingManager aan om een Pokemon uit de API te downloaden
    func pokemonLaden(url: String) {
        NetworkingManager().getSpecifiekePokemon(url: url) { (pokemon) in
            self.pokemon = pokemon
        }
    }
    
}
