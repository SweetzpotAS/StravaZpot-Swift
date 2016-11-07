//
//  SegmentAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class SegmentAPITest: XCTestCase {
    
    func testShouldRetrieveASegment() {
        let client = MockHTTPClient(respondWithJSON: SEGMENT_JSON)
        let api = SegmentAPI(client: client)
        
        var result : StravaResult<Segment>?
        api.retrieveSegment(withID: 229781).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segments/229781"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldListCurrentAthleteStarrredSegments() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = SegmentAPI(client: client)
        
        var result : StravaResult<EquatableArray<Segment>>?
        api.listMyStarredSegments().execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segments/starred"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldListAnotherAthleteStarrredSegments() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = SegmentAPI(client: client)
        
        var result : StravaResult<EquatableArray<Segment>>?
        api.listAthleteStarredSegments(withID: 1234).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athletes/1234/segments/starred"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldStarASegment() {
        let client = MockHTTPClient(respondWithJSON: SEGMENT_JSON)
        let api = SegmentAPI(client: client)
        
        var result : StravaResult<Segment>?
        api.starSegment(withID: 229781).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segments/229781/starred"))
        expect(client.putCalled).to(equal(true))
        expect(client.lastParameters["starred"] as! Bool?).to(equal(true))
    }
    
    func testShouldUnstarASegment() {
        let client = MockHTTPClient(respondWithJSON: SEGMENT_JSON)
        let api = SegmentAPI(client: client)
        
        var result : StravaResult<Segment>?
        api.unstarSegment(withID: 229781).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segments/229781/starred"))
        expect(client.putCalled).to(equal(true))
        expect(client.lastParameters["starred"] as! Bool?).to(equal(false))
    }
    
    let SEGMENT_JSON = "{" +
        "  \"id\": 229781," +
        "  \"resource_state\": 3," +
        "  \"name\": \"Hawk Hill\"," +
        "  \"activity_type\": \"Ride\"," +
        "  \"distance\": 2684.82," +
        "  \"average_grade\": 5.7," +
        "  \"maximum_grade\": 14.2," +
        "  \"elevation_high\": 245.3," +
        "  \"elevation_low\": 92.4," +
        "  \"start_latlng\": [" +
        "    37.8331119," +
        "    -122.4834356" +
        "  ]," +
        "  \"end_latlng\": [" +
        "    37.8280722," +
        "    -122.4981393" +
        "  ]," +
        "  \"climb_category\": 1," +
        "  \"city\": \"San Francisco\"," +
        "  \"state\": \"CA\"," +
        "  \"country\": \"United States\"," +
        "  \"private\": false," +
        "  \"starred\": false," +
        "  \"created_at\": \"2008-01-01T17:44:00Z\"," +
        "  \"updated_at\": \"2013-09-04T20:00:50Z\"," +
        "  \"total_elevation_gain\": 155.7," +
        "  \"map\": {" +
        "    \"id\": \"s229781\"," +
        "    \"polyline\": \"}g|e...VJr@\"," +
        "    \"resource_state\": 3" +
        "  }," +
        "  \"effort_count\": 51335," +
        "  \"athlete_count\": 7036," +
        "  \"hazardous\": false," +
        "  \"star_count\": 0" +
    "}"
}
