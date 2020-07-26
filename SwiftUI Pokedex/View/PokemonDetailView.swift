//
//  PokemonDetailView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 21/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var pokemonVM: PokemonViewModel
    
    @State var achtergrondKleur = UIColor()
    
    @State var showingStatView = false
    
    var body: some View {
        
        ZStack {
            
            Color("\(self.pokemonVM.types[0].type.name.capitalized)TypeKleur")
                .brightness(0.2)
                .hueRotation(.degrees(-10))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    
                    SpriteView(pokemonSpriteURL: pokemonVM.sprites.front_default).frame(width: 150, height: 150)
                    
                    VStack (alignment: .leading) {
                        Text("#\(pokemonVM.id)")
                        Text(pokemonVM.name.capitalized)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                        HStack {
                            ForEach(0..<pokemonVM.types.count, id: \.self) { type in
                                TypeView(type: self.pokemonVM.types[type].type)
                            }
                        }
                    }
                }
                
                HStack (spacing: 80){
                    
                    Button(action: {
                        self.showingStatView = false
                    }) {
                        VStack {
                            Text("About")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 10, height: 10)
                                
                                if self.showingStatView == false {
                                    Circle()
                                        .stroke(lineWidth: 1)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        .shadow(radius: 1)
                    }
                    
                    Button(action: {
                        self.showingStatView = true
                    }) {
                        VStack {
                            Text("Stats")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 10, height: 10)
                                
                                if self.showingStatView == true {
                                    Circle()
                                        .stroke(lineWidth: 1)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        .shadow(radius: 1)
                    }
                }
                
                if self.showingStatView {
                    StatView(pokemonVM: self.pokemonVM)
                        .frame(height: 450)
                } else {
                    AboutPokemonView(pokemonVM: pokemonVM)
                        .frame(height: 450)
                }
                
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonVM: PokemonViewModel(pokemonURL: "", specieURL: ""))
    }
}
