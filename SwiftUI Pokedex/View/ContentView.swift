//
//  ContentView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            NavigationView {
                List {
                    ForEach(0..<self.viewModel.pokedexArray.count, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemonURL: self.viewModel.pokedexArray[pokemon].url)) {
                                                                        PokemonCardView(viewModel: ViewModel(),
                                                                                        pokemonNaam: self.viewModel.pokedexArray[pokemon].name.capitalized, pokemonID: pokemon.self + 1)
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
