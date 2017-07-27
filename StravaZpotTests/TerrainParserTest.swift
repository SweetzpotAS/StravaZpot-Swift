//
//  TerrainParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class TerrainParserTest: XCTestCase {
    
    func testJSONisParsedToTerrain() {
        let json = JSON.parse("1")
        let parser = TerrainParser()
        
        let result = parser.from(json: json)
        let expected = Terrain.rollingHills
        
        expect(result).to(equal(expected))
    }
    
}
