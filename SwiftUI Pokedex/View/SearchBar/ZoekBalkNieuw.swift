//
//  ZoekBalkNieuw.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 31/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation
import SwiftUI

struct ZoekBalkNieuw: View {
    
    @Binding var zoekText: String
    @Binding var isActive: Bool
    
    var body: some View {
        
        HStack {
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .padding()
                
                TextField("Zoek Pokémon", text: $zoekText)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 50)
            }
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.4), radius: 7, x: 0, y: 7)
        
        }
        .animation(.default)
    }
}
