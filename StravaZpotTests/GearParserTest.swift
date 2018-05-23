//
//  GearParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class GearParserTest: XCTestCase {
    
    func testJSONisParsedToGear() {
        let json = JSON(parseJSON: "{" +
            "  \"id\": \"b105763\"," +
            "  \"primary\": false," +
            "  \"name\": \"Cannondale TT\"," +
            "  \"distance\": 476612.8," +
            "  \"resource_state\": 3," +
            "  \"brand_name\": \"Cannondale\"," +
            "  \"model_name\": \"Slice\"," +
            "  \"frame_type\": 4," +
            "  \"description\": \"Best bike EVER!!\"" +
            "}")
        let parser = GearParser()
        
        let result = parser.from(json: json)
        let expected = Gear(id: "b105763", resourceState: .detailed, primary: false, name: "Cannondale TT", distance: Distance(meters: 476612.8), brandName: "Cannondale", modelName: "Slice", frameType: FrameType.timeTrial, description: "Best bike EVER!!")
        
        expect(result).to(equal(expected))
    }
    
}
