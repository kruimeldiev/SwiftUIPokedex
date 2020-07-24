//
//  ViewModel.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var netwokringManager = NetworkingManager()
    
    @Published var volledigePokedex: Pokedex
    @Published var pokedexArray: [PokemonURL]
    
    @Published var geselecteerdePokemon = Pokemon(abilities: [],
                                                  height: 0,
                                                  id: 0,
                                                  name: "default",
                                                  species: SpeciesURL(url: "default"),
                                                  sprites: Sprite(front_default: "default"),
                                                  stats: [],
                                                  types: [],
                                                  weight: 0)
    
    init() {
        volledigePokedex = Pokedex(results: [])
        pokedexArray = [PokemonURL(name: "default", url: "default")]
        volledigePokedexLaden()
    }
    
    func volledigePokedexLaden() {
        
        self.netwokringManager.getVolledigePokedex (completion: { (Pokedex) in
            // De data die terug komt uit de completion handeler wordt opgeslagen als volledigePokedex
            self.volledigePokedex = Pokedex
            
            // De data van de volledigePokedex wordt als Array opgeslagen in de pokedexArray
            self.pokedexArray = self.volledigePokedex.results
        })
    }
    
}
