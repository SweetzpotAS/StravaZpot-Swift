//
//  StreamParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class StreamParserType: XCTestCase {
    
    func testJSONisParsedToStream() {
        let json = JSON(parseJSON: "  {" +
            "    \"type\": \"latlng\"," +
            "    \"data\": [" +
            "      [ 38.603734, -122.864112 ]" +
            "    ]," +
            "    \"series_type\": \"distance\"," +
            "    \"original_size\": 512," +
            "    \"resolution\": \"low\"" +
            "  }")
        let parser = StreamParser()
        
        let result = parser.from(json: json)
        let expected = Stream(type: .latlng, data: [[38.603734, -122.864112]], seriesType: .distance, originalSize: 512, resolution: .low)
        
        expect(result).to(equal(expected))
        expect(result.data).toNot(beNil())
        expect(result.data.count).to(equal(1))
    }
    
}
