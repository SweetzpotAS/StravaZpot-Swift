//
//  DistanceParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class DistanceParserTest : XCTestCase {
    
    func testJSONisParsedToDistance() {
        let json = JSON(parseJSON: "3621")
        let parser = DistanceParser()
        
        let result = parser.from(json: json)
        let expected = Distance(meters : 3621)
        
        expect(result).to(equal(expected))
    }
    
}
