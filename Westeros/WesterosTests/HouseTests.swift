//
//  HouseTests.swift
//  Westeros
//
//  Created by Fabio Gomez on 21/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkSigil     : Sigil!
    var lannisterSigil : Sigil!
    
    var sansa   : Person!
    var brandon   : Person!
    var tyrion : Person!
    
    var starkHouse     : House!
    var lannisterHouse : House!
    
    override func setUp() {
        super.setUp()

        starkHouse     = Repository.local.house(named: "Stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
        
        starkSigil     = starkHouse.sigil
        lannisterSigil = lannisterHouse.sigil
        
        sansa   = Person(name: "Sansa", alias: "Little Bird", house: starkHouse)
        brandon   = Person(name: "Brandon", alias:"The winged wolf", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence(){
        
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence(){
        
        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons (){
        
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: sansa)

        XCTAssertEqual(starkHouse.count, 3)
        starkHouse.add(person: brandon)

        XCTAssertEqual(starkHouse.count, 4)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 4)
    }
    
    func testHouseEquality(){
        
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        let jinxed = Repository.local.house(named: "Stark")
        XCTAssertEqual(jinxed, starkHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
    }
    
    func testHouseHashable(){
        
        XCTAssertNotNil(starkHouse.hashValue)
        
    }
    

}



