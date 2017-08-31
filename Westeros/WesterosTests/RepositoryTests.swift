//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Fabio Gomez on 23/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var localHouses : [House]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localHouses = Repository.local.houses
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation(){
        let houses = Repository.local.houses
        
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 9)
    }
    
    func testLocalRepositoryReturnSortedArrayOfHouses(){
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepoReturnsHousesByNameCaseInsensitively(){
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
        
        let grijander = Repository.local.house(named: "Grijander")
        XCTAssertNil(grijander)
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses(filteredBy: {$0.count == 1})
        XCTAssertEqual(filtered.count, 7)
    }
}
