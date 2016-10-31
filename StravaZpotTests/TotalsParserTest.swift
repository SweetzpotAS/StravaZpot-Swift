//
//  TotalsParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class TotalsParserTest: XCTestCase {
    
    func testJSONisParsedToTotals() {
        let json = JSON.parse("{" +
                "    \"count\": 3," +
                "    \"distance\": 12054.9," +
                "    \"moving_time\": 2190," +
                "    \"elapsed_time\": 2331," +
                "    \"elevation_gain\": 36.0," +
                "    \"achievement_count\": 0" +
            "  }")
        let parser = TotalsParser()
        
        let result = parser.from(json: json)
        let expected = Totals(count: 3, distance: Distance(meters: 12054.9), movingTime: Time(seconds: 2190), elapsedTime: Time(seconds: 2331), elevationGain: Distance(meters: 36.0), achievementCount: 0)
        
        expect(result).to(equal(expected))
    }
    
}
