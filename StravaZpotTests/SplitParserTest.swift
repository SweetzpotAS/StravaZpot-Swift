//
//  SplitParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class SplitParserTest: XCTestCase {

    func testJSONisParsedToSplit() {
        let json = JSON(parseJSON: 
                "{\"distance\": 1002.5," +
                "\"elapsed_time\": 276," +
                "\"elevation_difference\": 0," +
                "\"moving_time\": 276," +
                "\"split\": 1}")
        let parser = SplitParser()
        
        let result = parser.from(json: json)
        let expected = Split(distance: Distance(meters: 1002.5),
                             elevationDifference: Distance(meters: 0),
                             elapsedTime: Time(seconds: 276),
                             movingTime: Time(seconds: 276),
                             split: 1)
        
        expect(result).to(equal(expected))
    }
    
}
