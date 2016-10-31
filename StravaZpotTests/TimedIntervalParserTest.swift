//
//  TimedIntervalParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class TimedIntervalParserTest: XCTestCase {
    
    func testJSONisParsedToTimedInterval() {
        let json = JSON.parse("{\"min\" : 15.2, \"max\" : 23.8, \"time\" : 64}")
        let parser = TimedDoubleIntervalParser()
        
        let result = parser.from(json: json)
        let expected = TimedInterval<Double>(min: 15.2, max: 23.8, time: 64)
        
        expect(result).to(equal(expected))
    }
}
