//
//  StreamTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class StreamTypeParserTest: XCTestCase {
    
    func testJSONisParsedToStreamType() {
        let json = JSON(parseJSON: "\"grade_smooth\"")
        let parser = StreamTypeParser()
        
        let result = parser.from(json: json)
        let expected = StreamType.gradeSmooth
        
        expect(result).to(equal(expected))
    }
    
}
