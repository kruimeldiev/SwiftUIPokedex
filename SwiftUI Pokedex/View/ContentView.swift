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
    
    var body: some View {
        
        VStack {
            
            Text("SwiftUI Pokedex")
            
            NavigationView {
                ScrollView(showsIndicators: false) {
                    ForEach(0..<self.pokedexViewModel.pokedex.count, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemonVM: PokemonViewModel(pokemonURL: self.pokedexViewModel.pokedex[pokemon].url, specieURL: "\(Constants.POKEMON_SPECIES_URL)\(pokemon.self + 1)"))) {
                            PokemonCardView(pokemon: PokemonViewModel(pokemonURL: self.pokedexViewModel.pokedex[pokemon].url, specieURL: "\(Constants.POKEMON_SPECIES_URL)\(pokemon.self + 1)"), pokedexEntry: self.pokedexViewModel.pokedex[pokemon],pokemonID: pokemon.self + 1)
                            .padding(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
                .navigationBarTitle(Text("SwiftUI Pokedex"))
                .navigationBarHidden(true)
            }
            .accentColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
