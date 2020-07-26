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
        
        VStack(spacing: 5) {
            
            NavigationView {
                List {
                    ForEach(0..<self.pokedexViewModel.pokedex.count, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemonVM: PokemonViewModel(url: self.pokedexViewModel.pokedex[pokemon].url))) {
                            PokemonCardView(pokemon: self.pokedexViewModel.pokedex[pokemon])
                        }
                    }
                }
                .navigationBarTitle(Text("SwiftUI Pokedex"))
                .navigationBarHidden(false)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
