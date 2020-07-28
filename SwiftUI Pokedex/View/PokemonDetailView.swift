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
    
    @State var showingStatView = false
    
    var body: some View {
        
        ZStack {
            
            // De achtergrondkleur wordt bepaald door de eerste Type van de pokemon
            LinearGradient(gradient: Gradient(colors: [Color(self.pokemonVM.pokemonKleur), .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .hueRotation(.degrees(10))
                .edgesIgnoringSafeArea(.all)
            
            // Deze VStack zorgt voor de text (pokemon naam) die op de achtergrond staat
            VStack {
                Text(self.pokemonVM.name.uppercased())
                    .font(Font.system(size: 150, weight: .thin))
                    .offset(y: -400)
                    .foregroundColor(Color.white.opacity(0.04))
                    .fixedSize()
                    .frame(width: 50, height: 50, alignment: .center)
                Text(self.pokemonVM.name.uppercased())
                    .font(Font.system(size: 150, weight: .thin))
                    .offset(y: -320)
                    .foregroundColor(Color.white.opacity(0.04))
                    .fixedSize()
                    .frame(width: 50, height: 50, alignment: .center)
                Text(self.pokemonVM.name.uppercased())
                    .font(Font.system(size: 150, weight: .thin))
                    .offset(y: -240)
                    .foregroundColor(Color.white.opacity(0.04))
                    .fixedSize()
                    .frame(width: 50, height: 50, alignment: .center)
                Text(self.pokemonVM.name.uppercased())
                    .font(Font.system(size: 150, weight: .thin))
                    .offset(y: -160)
                    .foregroundColor(Color.white.opacity(0.04))
                    .fixedSize()
                    .frame(width: 50, height: 50, alignment: .center)
            }
            
            VStack {
                HStack {
                    ZStack {
                        SpriteView(pokemonSpriteURL: pokemonVM.sprites.front_default)
                            .frame(width: 150, height: 150)
                        SpriteCircleEffect()
                            .frame(width: 120, height: 120)
                            .blur(radius: 1.5)
                    }
                    VStack (alignment: .leading) {
                        Text("#\(pokemonVM.id)")
                            .bold()
                        Text(pokemonVM.name.capitalized)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .shadow(radius: 1)
                        HStack (alignment: .center) {
                            ForEach(0..<pokemonVM.types.count, id: \.self) { type in
                                TypeView(type: self.pokemonVM.types[type].type)
                            }
                        }
                    }
                }
                .offset(y: -20)
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.showingStatView = false
                    }) {
                        VStack {
                            Text("About")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .shadow(radius: 1)
                    }
                    Spacer()
                    Button(action: {
                        self.showingStatView = true
                    }) {
                        VStack {
                            Text("Stats")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .shadow(radius: 1)
                    }
                    Spacer()
                }
                
                if self.showingStatView {
                    StatView(pokemonVM: self.pokemonVM)
                        .frame(minWidth: 20, idealWidth: .infinity, maxWidth: .infinity, minHeight: 400, idealHeight: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    AboutPokemonView(pokemonVM: pokemonVM)
                        .frame(minWidth: 20, idealWidth: .infinity, maxWidth: .infinity, minHeight: 400, idealHeight: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
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
