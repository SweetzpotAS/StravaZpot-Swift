//
//  RouteAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class RouteAPITest: XCTestCase {
    
    func testShouldRetrieveARoute() {
        let client = MockHTTPClient(respondWithJSON: ROUTE_JSON)
        let api = RouteAPI(client: client)
        
        var result : StravaResult<Route>?
        api.retrieveRoute(withID: 1263727).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("routes/1263727"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShoudlListAthleteRoutes() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = RouteAPI(client: client)
        
        var result : StravaResult<EquatableArray<Route>>?
        api.listAthleteRoutes(withID: 1234).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athletes/1234/routes"))
        expect(client.getCalled).to(equal(true))
    }
    
    let ROUTE_JSON = "{" +
        "  \"athlete\": {" +
        "    \"id\": 265720," +
        "    \"resource_state\": 2" +
        "  }," +
        "  \"description\": \"\"," +
        "  \"distance\": 173625.6," +
        "  \"elevation_gain\": 2964.6," +
        "  \"id\": 1263727," +
        "  \"map\": {" +
        "    \"id\": \"r1263727\"," +
        "    \"summary_polyline\": \"qyrFxswgV|\"," +
        "    \"resource_state\": 3" +
        "  }," +
        "  \"name\": \"New Years Resolution - Santa Cruz Century Edition\"," +
        "  \"private\": false," +
        "  \"resource_state\": 3," +
        "  \"starred\": false," +
        "  \"timestamp\": 1419669292," +
        "  \"type\": 1," +
        "  \"sub_type\": 2," +
        "  \"segments\": [" +
        "    {" +
        "      \"id\": 3799," +
        "      \"resource_state\": 2," +
        "      \"name\": \"Highway 9 - HWY236 to Skyline\"" +
        "    }" +
        "  ]" +
    "}"
}
