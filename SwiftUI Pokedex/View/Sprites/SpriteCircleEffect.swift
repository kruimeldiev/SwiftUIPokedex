//
//  SpriteCircleEffect.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 27/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct SpriteCircleEffect: View {
    
    let gradient = LinearGradient(
        gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(0.2)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    public var body: some View {
        
            Circle()
                .stroke(gradient, style:
                    StrokeStyle(lineWidth: 10,
                                lineCap: .round))
        }
}

struct SpriteCircleEffect_Previews: PreviewProvider {
    static var previews: some View {
        SpriteCircleEffect()
    }
}
