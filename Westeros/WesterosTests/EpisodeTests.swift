//
//  EpisodeTests.swift
//  Westeros
//
//  Created by Fabio Gomez on 27/8/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    
    var season01 : Season!
    
    var e103     : Episode!
    var e104     : Episode!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        season01 = Repository.local.seasons.first
        
        e103 = Episode(title: "Grijander",
                       airDate: "01/01/1970".dateToString(),
                       image: #imageLiteral(resourceName: "e101.jpg"),
                       synopsis: "Grijander strikes back",
                       season: season01,
                       number: 3)
        
        e104 = Episode(title: "Krispin Klander",
                     airDate: "18/05/1973".dateToString(),
                       image: #imageLiteral(resourceName: "e101.jpg"),
                    synopsis: "Return of the Klander",
                      season: season01,
                      number: 4)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence() {
        XCTAssertNotNil(e103)
    }
    
    func testEpisodeCustomStringConvertible() {
        XCTAssertEqual(e103.airDate,"01/01/1970".dateToString())
    }
    
    func testEpisodeHashable(){
        XCTAssertNotNil(e103.hashValue)
    }

    func testSeasonComparision(){
        XCTAssertTrue(e103 < e104)
        
        XCTAssertTrue(e104 > e103)
    }
    
    func testEpisodeEquality(){
        let testEpisode = Episode(title: "Grijander",
                                airDate: "01/01/1970".dateToString(),
                                  image: #imageLiteral(resourceName: "e101.jpg"),
                               synopsis: "Grijander strikes back",
                                 season: season01,
                                 number: 3)
        XCTAssertEqual(e103, testEpisode)
    }
  
    
}
