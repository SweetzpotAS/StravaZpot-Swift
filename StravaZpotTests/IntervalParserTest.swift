//
//  IntervalParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class IntervalParserTest: XCTestCase {
    
    func testJSONIsParsedToIntervalOfDouble() {
        let json = JSON(parseJSON: "{\"min\" : 1.0, \"max\" : 7.5}")
        let parser = IntervalDoubleParser()
        
        let result = parser.from(json : json)
        let expected = Interval<Double>(min: 1.0, max: 7.5)
        
        expect(result).to(equal(expected))
    }
}
