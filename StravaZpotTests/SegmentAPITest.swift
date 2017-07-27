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
    
    func testShouldListSegmentEfforts() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = SegmentAPI(client: client)
        
        var result : StravaResult<EquatableArray<SegmentEffort>>?
        api.listSegmentEfforts(withID: 229781, forAthleteWithID: 1234, withStartDate: Date(day: 1, month: 1, year: 2015, hour: 0, minute: 0, second: 1), withEndDate: Date(day: 31, month: 12, year: 2015, hour: 23, minute: 59, second: 59)).of(page: 2, itemsPerPage: 10).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segments/229781/all_efforts"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["athlete_id"] as! Int?).to(equal(1234))
        expect(client.lastParameters["start_date_local"] as! String?).to(equal("2015-01-01T00:00:01Z"))
        expect(client.lastParameters["end_date_local"] as! String?).to(equal("2015-12-31T23:59:59Z"))
        expect(client.lastParameters["page"] as! Int?).to(equal(2))
        expect(client.lastParameters["per_page"] as! Int?).to(equal(10))
    }
    
    func testShouldRetrieveSegmentLeaderboard() {
        let client = MockHTTPClient(respondWithJSON: LEADERBOARD_JSON)
        let api = SegmentAPI(client: client)
        
        var result : StravaResult<Leaderboard>?
        api.retrieveSegmentLeaderboard(withID: 229781, withGender: .female, withAgeGroup: .age_25_34, withWeightClass: .kg_65_74, following: true, withClubID: 321, inDateRange: .thisMonth, withContextEntries: 4).of(page: 2, itemsPerPage: 10).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segments/229781/leaderboard"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["gender"] as! String?).to(equal("F"))
        expect(client.lastParameters["age_group"] as! String?).to(equal("25_34"))
        expect(client.lastParameters["weight_class"] as! String?).to(equal("65_74"))
        expect(client.lastParameters["following"] as! Bool?).to(equal(true))
        expect(client.lastParameters["club_id"] as! Int?).to(equal(321))
        expect(client.lastParameters["date_range"] as! String?).to(equal("this_month"))
        expect(client.lastParameters["context_entries"] as! Int?).to(equal(4))
        expect(client.lastParameters["page"] as! Int?).to(equal(2))
        expect(client.lastParameters["per_page"] as! Int?).to(equal(10))
    }
    
    func testShouldExploreNearbySegments() {
        let client = MockHTTPClient(respondWithJSON: "{ segments : [] }")
        let api = SegmentAPI(client: client)
        
        var result : StravaResult<ExploreResult>?
        api.explore(inRegion: Bounds(southWest: Coordinates(latitude: 15, longitude: -24), northEast: Coordinates(latitude: -32, longitude: 40)), withActivityType: .running, withMinCategory: 3, withMaxCategory: 7).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segments/explore"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["bounds"] as! String?).to(equal("15.0,-24.0,-32.0,40.0"))
        expect(client.lastParameters["activity_type"] as! String?).to(equal("running"))
        expect(client.lastParameters["min_cat"] as! Int?).to(equal(3))
        expect(client.lastParameters["max_cat"] as! Int?).to(equal(7))
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
    
    let LEADERBOARD_JSON = "{" +
        "  \"entry_count\": 7037," +
        "  \"entries\": [" +
        "    {" +
        "      \"athlete_name\": \"Jim Whimpey\"," +
        "      \"athlete_id\": 123529," +
        "      \"athlete_gender\": \"M\"," +
        "      \"average_hr\": 190.5," +
        "      \"average_watts\": 460.8," +
        "      \"distance\": 2659.89," +
        "      \"elapsed_time\": 360," +
        "      \"moving_time\": 360," +
        "      \"start_date\": \"2013-03-29T13:49:35Z\"," +
        "      \"start_date_local\": \"2013-03-29T06:49:35Z\"," +
        "      \"activity_id\": 46320211," +
        "      \"effort_id\": 801006623," +
        "      \"rank\": 1," +
        "      \"athlete_profile\": \"http://pics.com/227615/large.jpg\"" +
        "    }," +
        "    {" +
        "      \"athlete_name\": \"Chris Zappala\"," +
        "      \"athlete_id\": 11673," +
        "      \"athlete_gender\": \"M\"," +
        "      \"average_hr\": null," +
        "      \"average_watts\": 368.3," +
        "      \"distance\": 2705.7," +
        "      \"elapsed_time\": 374," +
        "      \"moving_time\": 374," +
        "      \"start_date\": \"2012-02-23T14:50:16Z\"," +
        "      \"start_date_local\": \"2012-02-23T06:50:16Z\"," +
        "      \"activity_id\": 4431903," +
        "      \"effort_id\": 83383918," +
        "      \"rank\": 2," +
        "      \"athlete_profile\": \"http://pics.com/227615/large.jpg\"" +
        "    }" +
        "  ]" +
    "}"
}
