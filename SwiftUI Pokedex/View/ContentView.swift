//
//  ContentView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pokedexViewModel = PokedexViewModel()
    
    @State private var pokemonZoekText = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("SwiftUI Pokédex")
                    .font(Font.system(size: 30, weight: .bold))
                    .padding(20)
                    .offset(x: 10)
                
                SearchBar(zoekText: $pokemonZoekText)
                    .accentColor(.blue)
                    
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(self.pokedexViewModel.pokedex.indices.filter {
                        // Als de pokemonZoekText een lege String is, dan worden alle Pokemon weergegeven
                        self.pokemonZoekText.isEmpty ? true : self.pokedexViewModel.pokedex[$0].name.localizedCaseInsensitiveContains(self.pokemonZoekText)
                    }, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemonVM: PokemonViewModel(pokemonURL: self.pokedexViewModel.pokedex[pokemon].url,
                                                                                                  specieURL: "\(Constants.POKEMON_SPECIES_URL)\(pokemon.self + 1)"))) {
                            PokemonCardView(pokemon: PokemonViewModel(pokemonURL: self.pokedexViewModel.pokedex[pokemon].url,
                                                                      specieURL: "\(Constants.POKEMON_SPECIES_URL)\(pokemon.self + 1)"),
                                            pokedexEntry: self.pokedexViewModel.pokedex[pokemon],
                                            pokemonID: pokemon.self + 1)
                                                .padding(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
                .navigationBarTitle(Text("SwiftUI Pokedex"))
                .navigationBarHidden(true)
            }
        }
        .accentColor(.white)
    }
}
