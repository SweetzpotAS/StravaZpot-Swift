//
//  SegmentEffortAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class SegmentEffortAPITest: XCTestCase {
    
    func testShouldRetrieveASegmentEffort() {
        let client = MockHTTPClient(respondWithJSON: SEGMENT_EFFORT_JSON)
        let api = SegmentEffortAPI(client: client)
        
        var result : StravaResult<SegmentEffort>?
        api.retrieveSegmentEffort(withID: 269990681).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segment_efforts/269990681"))
        expect(client.getCalled).to(equal(true))
    }
    
    let SEGMENT_EFFORT_JSON = "{" +
        "  \"id\": 269990681," +
        "  \"resource_state\": 3," +
        "  \"name\": \"Geysers Road Climb\"," +
        "  \"activity\": {" +
        "    \"id\": 14296826," +
        "    \"resource_state\": 1" +
        "  }," +
        "  \"athlete\": {" +
        "    \"id\": 227615," +
        "    \"resource_state\": 1" +
        "  }," +
        "  \"elapsed_time\": 1137," +
        "  \"moving_time\": 1137," +
        "  \"start_date\": \"2013-03-30T18:43:50Z\"," +
        "  \"start_date_local\": \"2013-03-30T11:43:50Z\"," +
        "  \"distance\": 6001.7," +
        "  \"start_index\": 5348," +
        "  \"end_index\": 6485," +
        "  \"average_cadence\": 79.1," +
        "  \"average_watts\": 357.2," +
        "  \"device_watts\": false," +
        "  \"average_heartrate\": 177.8," +
        "  \"max_heartrate\": 192.0," +
        "  \"segment\": {" +
        "    \"id\": 1818385," +
        "    \"resource_state\": 2," +
        "    \"name\": \"Geysers Road Climb\"," +
        "    \"activity_type\": \"Ride\"," +
        "    \"distance\": 6001.74," +
        "    \"average_grade\": 6.2," +
        "    \"maximum_grade\": 23.5," +
        "    \"elevation_high\": 745.6," +
        "    \"elevation_low\": 371.0," +
        "    \"start_latlng\": [" +
        "      38.81038486," +
        "      -122.85571538" +
        "    ]," +
        "    \"end_latlng\": [" +
        "      38.79168709," +
        "      -122.82848568" +
        "    ]," +
        "    \"climb_category\": 3," +
        "    \"city\": \"Cloverdale\"," +
        "    \"state\": \"CA\"," +
        "    \"country\": \"United States\"," +
        "    \"private\": false" +
        "  }," +
        "  \"kom_rank\": null," +
        "  \"pr_rank\": 2" +
    "}"
}
