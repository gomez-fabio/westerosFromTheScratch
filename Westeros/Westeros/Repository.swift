//
//  Repository.swift
//  Westeros
//
//  Created by Fabio Gomez on 23/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

final class Repository {
    
    static let local = LocalFactory()
    
}

protocol HouseFactory {
    
    typealias Filter = (House)->Bool
    
    var houses : [House] {get}
    func house(named: String) ->House?
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory : HouseFactory {
    
    func houses(filteredBy: Filter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }

    var houses: [House] {
        get {
        
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.png"), description: "Three headed dragon")
            
            // La url puede fallar de ahí que la pongamos como opcional por narices
            let starkURL     = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            let stark     = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", wikiURL: starkURL)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", wikiURL: lannisterURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire & Blood", wikiURL: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            let jaime  = Person(name: "Jaime", alias: "Kingslayer", house: lannister)
            
            let daenerys = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            
            // Añadimos personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, cersei, jaime)
            targaryen.add(person: daenerys)
            
            return [stark, lannister, targaryen].sorted()
            
        }
    }
    
    // Opcional de casa, por si la casa que pasamos no existe, entonces devolvemos nil
    func house(named: String) -> House? {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }

    
}
