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
        
        VStack {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(self.pokemonVM.pokemonKleur), Color(self.pokemonVM.pokemonKleur).opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .hueRotation(.degrees(10))
                    .clipShape(CustomCornerRadius(corner: [.bottomLeft, .bottomRight], radius: 10))
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                    .shadow(color: Color(self.pokemonVM.pokemonKleur).opacity(0.7), radius: 5, x: 0, y: 5)
                
                // Deze VStack zorgt voor de text (pokemon naam) die op de achtergrond staat
                VStack {
                    Text(self.pokemonVM.name.uppercased())
                        .font(Font.system(size: 150, weight: .thin))
                        .offset(x: 40, y: -210)
                        .foregroundColor(Color.white.opacity(0.04))
                        .fixedSize()
                        .frame(width: 50, height: 50, alignment: .center)
                    Text(self.pokemonVM.name.uppercased())
                        .font(Font.system(size: 150, weight: .thin))
                        .offset(x: -40, y: -140)
                        .foregroundColor(Color.white.opacity(0.04))
                        .fixedSize()
                        .frame(width: 50, height: 50, alignment: .center)
                    Text(self.pokemonVM.name.uppercased())
                        .font(Font.system(size: 150, weight: .thin))
                        .offset(x: 40, y: -70)
                        .foregroundColor(Color.white.opacity(0.04))
                        .fixedSize()
                        .frame(width: 50, height: 50, alignment: .center)
                    Text(self.pokemonVM.name.uppercased())
                        .font(Font.system(size: 150, weight: .thin))
                        .offset(x: -40)
                        .foregroundColor(Color.white.opacity(0.04))
                        .fixedSize()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                
                // Deze HStack regelt de Sprite, naam, ID en Types van de Pokémon
                HStack {
                    ZStack {
                        SpriteView(pokemonSpriteURL: pokemonVM.sprites.front_default)
                            .frame(width: 150, height: 150)
                        SpriteCircleEffect()
                            .frame(width: 120, height: 120)
                            .blur(radius: 1.5)
                    }
                    VStack (alignment: .leading) {
                        Text("#\(pokemonVM.id, specifier: "%03d")")
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
            }
            
            HStack {
                Spacer()
                Button(action: {
                    self.showingStatView = false
                }) {
                    VStack {
                        Text("About")
                            .font(.title)
                        .bold()
                            .foregroundColor(Color(self.pokemonVM.pokemonKleur))
                    }
                }
                Spacer()
                Button(action: {
                    self.showingStatView = true
                }) {
                    VStack {
                        Text("Stats")
                            .font(.title)
                            .foregroundColor(Color(self.pokemonVM.pokemonKleur))
                    }
                }
                Spacer()
            }
            .padding(.top)
            
            if self.showingStatView == true {
                StatView(pokemonVM: self.pokemonVM)
            } else {
                AboutPokemonView(pokemonVM: self.pokemonVM)
            }
            
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonVM: PokemonViewModel(pokemonURL: "", specieURL: ""))
    }
}
