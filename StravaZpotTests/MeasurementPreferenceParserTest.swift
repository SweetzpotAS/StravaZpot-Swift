//
//  MeasurementPreferenceParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class MeasurementPreferenceParserTest: XCTestCase {
    
    func testJSONisParsedToMeasurementPreference() {
        let json = JSON(parseJSON: "\"feet\"")
        let parser = MeasurementPreferenceParser()
        
        let result = parser.from(json: json)
        let expected = MeasurementPreference.feet
        
        expect(result).to(equal(expected))
    }
    
}
