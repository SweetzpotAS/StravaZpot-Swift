//
//  SpeedParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class SpeedParserTest: XCTestCase {
    
    func testJSONisParsedToSpeed() {
        let json = JSON(parseJSON: "25.4")
        let parser = SpeedParser()
        
        let result = parser.from(json: json)
        let expected = Speed(metersPerSecond: 25.4)
        
        expect(result).to(equal(expected))
    }
    
}
