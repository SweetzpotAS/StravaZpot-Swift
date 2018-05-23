//
//  SeriesTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class SeriesTypeParserTest: XCTestCase {
    
    func testJSONisParsedToSeriesType() {
        let json = JSON(parseJSON: "\"time\"")
        let parser = SeriesTypeParser()
        
        let result = parser.from(json: json)
        let expected = SeriesType.time
        
        expect(result).to(equal(expected))
    }
    
}
