//
//  TimeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class TimeParserTest: XCTestCase {
    
    func testJSONisParsedToTime() {
        let json = JSON(parseJSON: "60")
        let parser = TimeParser()
        
        let result = parser.from(json: json)
        let expected = Time(seconds: 60)
        
        expect(result).to(equal(expected))
    }
    
}
