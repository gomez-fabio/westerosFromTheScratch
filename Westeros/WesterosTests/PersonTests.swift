//
//  PersonTests.swift
//  Westeros
//
//  Created by Fabio Gomez on 21/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    
    // Si no fuera opcional debería incializarla, no es lo que queremos, así que puede estar a nil hasta que lo instancie en el setup del test
    // opcional por "cojones"

    var starkHouse     : House!
    var lannisterHouse : House!
    
    var starkSigil     : Sigil!
    var lannisterSigil : Sigil!
    
    var robb   : Person!
    var arya   : Person!
    var tyrion : Person!
    var ned    : Person!

    override func setUp() {
        super.setUp()
        
        starkHouse     = Repository.local.house(named: "Stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
        
        starkSigil     = starkHouse.sigil
        lannisterSigil = lannisterHouse.sigil
        
        robb   = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya   = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        ned    = Person(name: "Eddard", alias: "Ned", house: starkHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence(){
        
        XCTAssertNotNil(ned)
    }
    
    func testFullName(){
        
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality (){
        
        // Identidad
        XCTAssertEqual(ned, ned)
        
        // Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
        
    }
    
    func testPersonComparision(){
        
        XCTAssertLessThan(arya, tyrion)
    }
    
}
