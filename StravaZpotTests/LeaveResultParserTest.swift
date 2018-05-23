//
//  LeaveResultParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class LeaveResultParserTest: XCTestCase {
    
    func testJSONisParserToLeaveResult() {
        let json = JSON(parseJSON: "{\"success\" : true, \"active\" : false}")
        let parser = LeaveResultParser()
        
        let result = parser.from(json: json)
        let expected = LeaveResult(success: true, active: false)
        
        expect(result).to(equal(expected))
    }
    
}
