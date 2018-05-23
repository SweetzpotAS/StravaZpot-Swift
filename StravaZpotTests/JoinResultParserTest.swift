//
//  JoinResultParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class JoinResultParserTest: XCTestCase {
    
    func testJSONisParsedToJoinResult() {
        let json = JSON(parseJSON: "{\"success\": true, \"active\": true, \"membership\": \"pending\"}")
        let parser = JoinResultParser()
        
        let result = parser.from(json: json)
        let expected = JoinResult(success: true, active: true, membership: .pending)
        
        expect(result).to(equal(expected))
    }
    
}
