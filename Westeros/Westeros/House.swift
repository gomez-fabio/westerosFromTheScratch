//
//  House.swift
//  Westeros
//
//  Created by Fabio Gomez on 21/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

typealias Words   = String
typealias Members = Set<Person> // El set no permite elementos repetidos

// MARK: - Classes
final class House {
    
    let name    : String
    let sigil   : Sigil
    let words   : Words
    let wikiURL : URL
    private var _members : Members
    
    init(name: String, sigil: Sigil, words: Words, wikiURL: URL) {
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, wikiURL)
        _members = Members()
    }
}

final class Sigil {
    
    let description : String
    let image       : UIImage
    
    init(image: UIImage, description: String){
        (self.image, self.description) = (image, description)
    }
}

extension House {
    var count : Int {
        return _members.count
    }
    
    func add(person: Person){
        guard person.house.name == name else {
            return
        }
        _members.insert(person)
    }
    
    // Función variádica, función que puede recibir n parámetros separados por comas y lo que recibe lo mete en un array que despues podemos recorrer de manera habitual
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    // Sorted [Person]
    func sortedMembers() -> [Person] {
        return _members.sorted()
    }
}


extension House {
    var HouseProxy : String {
        return "\(name) \(words) \(count)"
    }
    
    var HouseProxyComparison: String {
        return name
    }
}

extension House : Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.HouseProxy == rhs.HouseProxy
    }
}

extension House : Hashable {
    var hashValue: Int {
        return HouseProxy.hashValue
    }
}

extension House : Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.HouseProxyComparison < rhs.HouseProxyComparison
    }

}







