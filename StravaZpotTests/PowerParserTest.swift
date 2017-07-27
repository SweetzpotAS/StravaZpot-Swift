//
//  PowerParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class PowerParserTest: XCTestCase {
    
    func testJSONisParsedToPower() {
        let json = JSON.parse("{\"zones\" : [{\"min\":0, \"max\":1}]}")
        let parser = PowerParser()
        
        let result = parser.from(json: json)
        let expected = Power(zones: EquatableArray(array: [Interval<Double>(min:0, max:1)]))
        
        expect(result).to(equal(expected))
    }
    
}
