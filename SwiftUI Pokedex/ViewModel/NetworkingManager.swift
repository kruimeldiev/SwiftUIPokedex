//
//  NetworkingManager.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct NetworkingManager {
    
    // De completion handeler (completion) is een closure die pas na de functie wordt toegepast
    // @escaping betekend dat het result van de completion kan 'escapen', hierdoor wordt de opgehaalde JSON data doorgestuurd
    func getVolledigePokedex(completion: @escaping(Pokedex) -> ()) {
        
        // De string met de POKEDEX_URL uit het Constants bestand ophalen en omzetten in een URL
        guard let url = URL(string: Constants.POKEDEX_URL) else {
            print("Pokedex URL is niet beschikbaar.")
            return
        }
        
        // URLSession is een klasse die data kan downloaden of uploaden via een gegeven URL
        // De .shared klasse zorgt dat data uit de URL wordt gedownload
        // De .dataTask klasse haalt data uit de URLSessie op en plaatst deze in 'data'
        let dataTask = URLSession.shared.dataTask(with: url) {data, _, error in
            
            // Eerst zorgen voor error handeling
            if error == nil && data != nil {
                
                // De decoder 'decode' het JSON bestand
                let decoder = JSONDecoder()
                
                do {
                    let pokedex = try decoder.decode(Pokedex.self, from: data!)
                    
                    // DispatchQueue zorgt ervoor dat de opgehaalde data, in delen naar de complation handler worden gestuurd om laadt tijd te verminderen
                    DispatchQueue.main.async {
                        // De 'pokedex' wordt naar de completion handler gestuurd welke vervolgens gebruikt kan worden in de View
                        completion(pokedex)
                    }
                } catch {
                    print("Error tijdens Pokedex JSON parsing")
                }
            }
        }
        
        // Hier roep je de dataTask aan
        dataTask.resume()
    }
    
    func getSpecifiekePokemon(url: String, completion: @escaping(Pokemon) -> ()) {
        
        guard let url = URL(string: url) else {
            print("Pokemon URL is niet beschikbaar")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) {data, _, error in
            if error == nil && data != nil {
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data!)
                    DispatchQueue.main.async {
                        completion(pokemon)
                    }
                } catch {
                    print("Error tijdens Pokemon JSON parsing")
                }
            }
        }
        dataTask.resume()
    }
    
    func getAbilityDetail(url: String, completion: @escaping(AbilityDetail) -> ()) {
        
        guard let url = URL(string: url) else {
            print("Ability URL is niet beschikbaar")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) {data, _, error in
            if error == nil && data != nil {
                do {
                    let ability = try JSONDecoder().decode(AbilityDetail.self, from: data!)
                    DispatchQueue.main.async {
                        completion(ability)
                    }
                } catch {
                    print("Error tijdens Ability JSON parsing")
                }
            }
        }
        dataTask.resume()
    }
    
    func getPokemonSpecies(url: String, completion: @escaping (PokemonSpecies) -> ()) {
        
        guard let url = URL(string: url) else {
            print("Pokemon species URL is niet beschikbaar")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) {data, _, error in
            if error == nil && data != nil {
                do {
                    let species = try JSONDecoder().decode(PokemonSpecies.self, from: data!)
                    DispatchQueue.main.async {
                        completion(species)
                    }
                } catch {
                    print("Error tijdens Species JOSN parsing")
                }
            }
        }
        dataTask.resume()
    }
}
