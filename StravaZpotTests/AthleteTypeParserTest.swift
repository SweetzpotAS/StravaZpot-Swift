//
//  AthleteTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class AthleteTypeParserTest: XCTestCase {
    
    func testJSONisParsedToAthleteType() {
        let json = JSON.parse("1")
        let parser = AthleteTypeParser()
        
        let result = parser.from(json: json)
        let expected = AthleteType.runner
        
        expect(result).to(equal(expected))
    }
    
}
