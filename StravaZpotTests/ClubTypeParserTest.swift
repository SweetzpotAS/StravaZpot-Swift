//
//  ClubTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ClubTypeParserTest: XCTestCase {
    
    func testJSONisParsedToClubType() {
        let json = JSON(parseJSON: "\"shop\"")
        let parser = ClubTypeParser()
        
        let result = parser.from(json: json)
        let expected = ClubType.shop
        
        expect(result).to(equal(expected))
    }
    
}
