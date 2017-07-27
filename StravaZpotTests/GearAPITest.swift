//
//  GearAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class GearAPITest: XCTestCase {
    
    func testShouldGetGear() {
        let client = MockHTTPClient(respondWithJSON: GEAR_JSON)
        let api = GearAPI(client: client)
        
        var result : StravaResult<Gear>?
        api.getGear(withID: "b105763").execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("gear/b105763"))
        expect(client.getCalled).to(equal(true))
    }
    
    let GEAR_JSON = "{" +
        "  \"id\": \"b105763\"," +
        "  \"primary\": false," +
        "  \"name\": \"Cannondale TT\"," +
        "  \"distance\": 476612.8," +
        "  \"resource_state\": 3," +
        "  \"brand_name\": \"Cannondale\"," +
        "  \"model_name\": \"Slice\"," +
        "  \"frame_type\": 4," +
        "  \"description\": \"Best bike EVER!!\"" +
    "}"
}
