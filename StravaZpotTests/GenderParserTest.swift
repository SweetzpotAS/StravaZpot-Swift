//
//  GenderParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class GenderParserTest: XCTestCase {
    
    func testJSONisParsedToGender() {
        let json = JSON.parse("\"M\"")
        let parser = GenderParser()
        
        let result = parser.from(json: json)
        let expected = Gender.male
        
        expect(result).to(equal(expected))
    }
    
}
