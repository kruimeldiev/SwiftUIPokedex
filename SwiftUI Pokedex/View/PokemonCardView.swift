//
//  PokemonCardView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 19/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct PokemonCardView: View {
    
    @ObservedObject var pokemon: PokemonViewModel
    
    var pokedexEntry: PokedexEntryViewModel
    var pokemonID: Int
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                Text("#\(self.pokemonID, specifier: "%03d")")
                    .font(Font.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                    .shadow(radius: 1)
                Text(self.pokemon.name.capitalized)
                    .font(Font.system(size: 20, weight: .black))
                    .foregroundColor(.white)
                    .shadow(radius: 1)
                HStack {
                    ForEach(0..<self.pokemon.types.count, id: \.self) { type in
                        TypeView(type: self.pokemon.types[type].type)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 80, height: 80, alignment: .leading)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom).opacity(0.5))
            .background(Color(self.pokemon.pokemonKleur).hueRotation(.degrees(10)).brightness(0.1))
            .cornerRadius(10)
            .shadow(color: Color(self.pokemon.pokemonKleur).opacity(0.2), radius: 7, x: 0, y: 7)
            
            ZStack {
                SpriteView(pokemonSpriteURL: "\(Constants.SPRITE_URL)\(pokemonID).png")
                    .frame(width: 120, height: 120)
                
                SpriteCircleEffect()
                    .frame(width: 120, height: 120)
                    .blur(radius: 1.5)
            }
            .offset(x: 100)
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: PokemonViewModel(pokemonURL: "", specieURL: ""), pokedexEntry: PokedexEntryViewModel(entry: PokedexEntry(name: "", url: "")), pokemonID: 0)
    }
}
