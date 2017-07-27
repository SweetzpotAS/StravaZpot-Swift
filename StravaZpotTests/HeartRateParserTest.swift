//
//  HeartRateParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class HeartRateParserTest: XCTestCase {
    
    func testJSONisParsedToHeartRate() {
        let json = JSON.parse("{\"custom_zones\" : false, \"zones\": [{\"min\":0, \"max\":1}, {\"min\":1, \"max\":2}] }")
        let parser = HeartRateParser()
        
        let result = parser.from(json: json)
        let expected = HeartRate(customZones: false, zones: EquatableArray(array: [Interval<Double>(min:0, max:1), Interval<Double>(min:1, max:2)]))
        
        expect(result).to(equal(expected))
    }
    
}
