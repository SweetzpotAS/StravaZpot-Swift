//
//  WorkoutTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class WorkoutTypeParserTest: XCTestCase {
    
    func testJSONisParsedToWorkoutType() {
        let json = JSON(parseJSON: "11")
        let parser = WorkoutTypeParser()
        
        let result = parser.from(json: json)
        let expected = WorkoutType.raceRide
        
        expect(result).to(equal(expected))
    }
}
