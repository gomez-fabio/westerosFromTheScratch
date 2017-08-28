//
//  SeasonTests.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    var season01 : Season!
    var season08 : Season!
    
    var e103     : Episode!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        season01 = Repository.local.seasons.first
        
        season08 = Season(name: "Season 8",
                              releaseDate: "09/05/2018".dateToString())

        
        e103 = Episode(title: "Grijander",
                     airDate: "01/01/1970".dateToString(),
                       image: #imageLiteral(resourceName: "e101.jpg"),
                    synopsis: "Grijander strikes back",
                      season: season01)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
 
    func testSeasonExistence() {
        XCTAssertNotNil(season01)
    }
    
    func testSeasonCustomStringConvertible() {
        XCTAssertEqual(season08.releaseDate,"09/05/2018".dateToString())
    }
    
    func testAddEpisode() {
        XCTAssertEqual(season01.count, 2)
        
        season01.add(episode: e103)
        XCTAssertEqual(season01.count, 3)
    }
    
    func testSeasonHashable(){
        XCTAssertNotNil(season01.hashValue)
    }
    
    func testSeasonComparision(){
        XCTAssertTrue(season01 < season08)
        
        XCTAssertTrue(season08 > season01)
    }
    
    func testSeasonEquality() {
        
        let testSeason = Season(name: "Season 8",
                         releaseDate: "09/05/2018".dateToString())
        
        XCTAssertEqual(season08, testSeason)
    }
}
