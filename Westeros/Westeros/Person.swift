//
//  Person.swift
//  Westeros
//
//  Created by Fabio Gomez on 21/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import Foundation

final class Person{
    
    let name   : String
    let house  : House
    private let _alias : String?
    
    // variable computada, tienen getter y setter
    var alias: String {
        get{
            return _alias ?? ""
        }
    }
    
    init(name: String, alias: String?, house: House) {
        (self.name, _alias, self.house) = (name, alias, house)
    }
    
    convenience init(name: String, house: House){
        self.init(name: name,  alias: nil, house: house)
    }
    
// Otra opción en lugar de los dos inicializadores sería, uno solo y al alias darle un valor por defecto, en este caso nil
//    init(name: String, alias: String? = nil, house: House) {
//        (self.name, _alias, self.house) = (name, alias, house)
//    }
    
}

extension Person{
    // variable computada, si no se especifica nada, es un getter (mira arriba el alias, donde explicitamente le indicamos el getter)
    var fullName : String{
        return "\(name) \(house.name)"
    }
}

extension Person {
    var proxy : String {
            return "\(name) \(alias) \(house.name)"
    }
    
    var proxyForComparison : String {
        return name
    }
}

extension Person : Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension Person : Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person : Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}




