//
//  RouteSubtypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class RouteSubtypeParserTest : XCTestCase {
    
    func testJSONisParsedToRouteSubtype() {
        let json = JSON(parseJSON: "3")
        let parser = RouteSubtypeParser()
        
        let result = parser.from(json: json)
        let expected = RouteSubtype.cx
        
        expect(result).to(equal(expected))
    }
}
