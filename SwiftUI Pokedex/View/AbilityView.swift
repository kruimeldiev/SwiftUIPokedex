//
//  AbilityView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 23/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct AbilityView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var abilityURL: String
    @State var weergegevenAbility: AbilityDetail
    
    var body: some View {
        
        HStack {
            Text(self.weergegevenAbility.name)
            Text(self.weergegevenAbility.flavor_text_entries[0].flavor_text)
        }.onAppear {
            self.viewModel.netwokringManager.getAbilityDetail(url: self.abilityURL) { (AbilityDetail) in
                self.weergegevenAbility = AbilityDetail
            }
        }
        
    }
}

struct AbilityView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityView(abilityURL: "default", weergegevenAbility: AbilityDetail(name: "default", flavor_text_entries: [Flavor_Text(flavor_text: "default")]))
    }
}
