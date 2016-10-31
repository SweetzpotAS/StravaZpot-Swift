//
//  ZonesParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ZonesParserTest: XCTestCase {
   
    func testJSONisParsedToZones() {
        let json = JSON.parse("{" +
            "  \"heart_rate\": {" +
            "    \"custom_zones\": false," +
            "    \"zones\": [" +
            "      { \"min\": 0, \"max\": 115 }" +
            "    ]" +
            "  }," +
            "  \"power\": {" +
            "      \"zones\": [" +
            "        { \"min\": 0, \"max\": 180 }" +
            "      ]" +
            "    }" +
            "}")
        let parser = ZonesParser()
        
        let result = parser.from(json: json)
        let expected = Zones(heartRate: HeartRate(customZones: false, zones: EquatableArray(array: [Interval<Double>(min: 0, max: 115)])),
                             power: Power(zones: EquatableArray(array:[Interval<Double>(min:0, max:180)])))
        
        expect(result).to(equal(expected))
    }
    
}
