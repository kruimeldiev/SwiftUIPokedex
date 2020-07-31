//
//  PokemonDetailView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 21/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct SpriteView: View {
    
    @ObservedObject var spriteLoader = SpriteLoader()
    
    var placeholder: Image
    
    // De initialiser zorgt ervoor dat de spriteLader wordt aangeroepen om de sprite te downloaden
    // Als het downloaden mislukt, dan wordt de placeholder als sprite gebruikt
    init(pokemonSpriteURL: String, photoPlaceholder: Image = Image(systemName: "photo")) {
        self.placeholder = photoPlaceholder
        spriteLoader.spriteLaden(url: pokemonSpriteURL)
    }
    
    var body: some View {
        
        // Als het is gelukt om de sprite te downloaden, wordt deze als View teruggestuurd
        if let sprite = self.spriteLoader.pokemonSprite {
            return Image(uiImage: sprite).resizable()
        }
        
        // Anders wordt de placeholder gebruikt als sprite
        return placeholder
    }
}

struct SpriteView_Previews: PreviewProvider {
    static var previews: some View {
        SpriteView(pokemonSpriteURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/129.png")
    }
}
