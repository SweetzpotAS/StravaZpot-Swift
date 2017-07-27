//
//  RouteTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class RouteTypeParserTest: XCTestCase {
    
    func testJSONisParsedToRouteType() {
        let json = JSON.parse("1")
        let parser = RouteTypeParser()
        
        let result = parser.from(json: json)
        let expected = RouteType.ride
        
        expect(result).to(equal(expected))
    }
    
}
