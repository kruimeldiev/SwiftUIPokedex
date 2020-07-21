//
//  SpriteLoader.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 21/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// Deze SpriteLoader is een klasse om de sprite van de geselecteerde pokemon op te halen uit de API
// Deze sprite wordt als UIImage opgeslagen met de naam 'pokemonSprite'

class SpriteLoader: ObservableObject {
    
    @Published var pokemonSprite: UIImage?
    
    func spriteLaden(url: String) {
        
        guard let spriteURL = URL(string: url) else {
            print("Sprite URL niet beschikbaar")
            return
        }
        
        URLSession.shared.dataTask(with: spriteURL) {data, _, error in
            
            if error == nil && data != nil {
                guard let image = data else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.pokemonSprite = UIImage(data: image)
                }
            } else {
                print("Sprite DataTask error")
                return
            }
        }.resume()
        
    }
    
}
