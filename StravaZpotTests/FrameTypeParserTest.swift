//
//  FrameTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class FrameTypeParserTest: XCTestCase {
 
    func testJSONisParsedToFrameType() {
        let json = JSON(parseJSON: "2")
        let parser = FrameTypeParser()
        
        let result = parser.from(json: json)
        let expected = FrameType.cross
        
        expect(result).to(equal(expected))
    }
}
