//
//  MapParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class MapParserTest: XCTestCase {
    
    func testJSONisParsedToMap() {
        let json = JSON.parse("{" +
                "    \"id\": \"a32193479\"," +
                "    \"summary_polyline\": \"{cteFjcaBkCx@gEz@\"," +
                "    \"resource_state\": 3" +
                "  }")
        let parser = MapParser()
        
        let result = parser.from(json: json)
        let expected = Map(id: "a32193479",
                           resourceState: .detailed,
                           summaryPolyline: "{cteFjcaBkCx@gEz@",
                           polyline: nil)
        
        expect(result).to(equal(expected))
    }
    
}
