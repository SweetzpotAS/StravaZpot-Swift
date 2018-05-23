//
//  SportTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class SportTypeParserTest: XCTestCase {
    
    func testJSONisParsedToSportType() {
        let json = JSON(parseJSON: "\"triathlon\"")
        let parser = SportTypeParser()
        
        let result = parser.from(json: json)
        let expected = SportType.triathlon
        
        expect(result).to(equal(expected))
    }
    
}
