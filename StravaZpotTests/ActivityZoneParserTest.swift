//
//  ActivityZoneParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ActivityZoneParserTest : XCTestCase {
    
    func testJSONisParsedToActivityZone() {
        let json = JSON.parse("  {" +
            "    \"score\": 215," +
            "    \"distribution_buckets\": [" +
            "      { \"min\": 0,   \"max\":115,  \"time\": 1735 }," +
            "      { \"min\": 115, \"max\": 152, \"time\": 5966 }" +
            "    ]," +
            "    \"type\": \"heartrate\"," +
            "    \"resource_state\": 3," +
            "    \"sensor_based\": true," +
            "    \"points\": 119," +
            "    \"custom_zones\": false," +
            "    \"max\": 196" +
            "  }")
        let parser = ActivityZoneParser()
        
        let result = parser.from(json: json)
        let expected = ActivityZone(resourceState: .detailed,
                                    distributionBuckets: EquatableArray(array: [TimedInterval<Double>(min: 0, max: 115, time: 1735), TimedInterval<Double>(min: 115, max: 152, time: 5966) ]),
                                    type: "heartrate",
                                    sensorBased: true,
                                    score: 215,
                                    points: 119,
                                    customZones: false,
                                    max: 196)
        
        expect(result).to(equal(expected))
    }
    
}
