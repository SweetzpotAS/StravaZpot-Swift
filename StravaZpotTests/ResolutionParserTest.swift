//
//  ResolutionParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ResolutionParserTest: XCTestCase {
    
    func testJSONisParsedToResolution() {
        let json = JSON(parseJSON: "\"low\"")
        let parser = ResolutionParser()
        
        let result = parser.from(json: json)
        let expected = Resolution.low
        
        expect(result).to(equal(expected))
    }
    
}
