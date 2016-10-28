//
//  PercentageParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class PercentageParserTest: XCTestCase {
    
    func testJSONisParsedToPercentage() {
        let json = JSON.parse("75")
        let parser = PercentageParser()
        
        let result = parser.from(json: json)
        let expected = Percentage(percent: 75)
        
        expect(result).to(equal(expected))
    }
    
}
