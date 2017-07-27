//
//  ActivityTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ActivityTypeParserTest: XCTestCase {
    
    func testJSONisParsedToActivityType() {
        let json = JSON.parse("\"Rowing\"")
        let parser = ActivityTypeParser()
        
        let result = parser.from(json: json)
        let expected = ActivityType.rowing
        
        expect(result).to(equal(expected))
    }
    
}
