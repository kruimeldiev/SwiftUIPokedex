//
//  CustomCornerRadius.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 30/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

// Met deze struct kun je de CornerRadius veranderen van specifieke hoeken van een View
struct CustomCornerRadius: Shape {
    
    var corner: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
    
}
