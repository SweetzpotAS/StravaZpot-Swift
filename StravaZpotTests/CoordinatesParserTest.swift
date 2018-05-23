//
//  CoordinatesParserTest.swift
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

class CoordinatesParserTest : XCTestCase {
    
    func testJSONIsParsedToCoordinates() {
        let json = JSON(parseJSON: "[23.6, -42.1]")
        let parser = CoordinatesParser()
        
        let result = parser.from(json: json)
        let expected = Coordinates(latitude: 23.6, longitude: -42.1)
        
        expect(result).to(equal(expected))
    }
    
}
