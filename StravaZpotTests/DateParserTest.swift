//
//  DateParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class DateParserTest: XCTestCase {
    
    func testJSONisParsedToDate() {
        let json = JSON.parse("\"2013-03-30T18:43:50Z\"")
        let parser = DateParser()
        
        let result = parser.from(json: json)
        let expected = Date(day: 30, month: 3, year: 2013, hour: 18, minute: 43, second: 50)
        
        expect(result).to(equal(expected))
    }
    
}
