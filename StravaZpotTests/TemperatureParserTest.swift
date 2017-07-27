//
//  TemperatureParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class TemperatureParserTest: XCTestCase {
    
    func testJSONisParsedToTemperature() {
        let json = JSON.parse("17.8")
        let parser = TemperatureParser()
        
        let result = parser.from(json: json)
        let expected = Temperature(celsiusDegrees: 17.8)
        
        expect(result).to(equal(expected))
    }
    
}
