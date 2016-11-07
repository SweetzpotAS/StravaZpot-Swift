//
//  ClubAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class ClubAPITest: XCTestCase {
    
    func testShouldRetrieveAClub() {
        let client = MockHTTPClient(respondWithJSON: CLUB_JSON)
        let api = ClubAPI(client: client)
        
        var result : StravaResult<Club>?
        api.retrieveClub(withID: 1).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("clubs/1"))
        expect(client.getCalled).to(equal(true))
    }

    func testShouldListClubAnnouncements() {
        let client = MockHTTPClient(respondWithJSON: ANNOUNCEMENTS_JSON)
        let api = ClubAPI(client: client)
        
        var result : StravaResult<EquatableArray<Announcement>>?
        api.listClubAnnouncements(withID: 109984).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("clubs/109984/announcements"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldListClubGroupEvents() {
        let client = MockHTTPClient(respondWithJSON: EVENTS_JSON)
        let api = ClubAPI(client: client)
        
        var result : StravaResult<EquatableArray<Event>>?
        api.listClubGroupEvents(withID: 1).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("clubs/1/group_events"))
        expect(client.getCalled).to(equal(true))
    }
    
    let CLUB_JSON = "{" +
        "  \"id\": 1," +
        "  \"resource_state\": 3," +
        "  \"name\": \"Team Strava Cycling\"," +
        "  \"profile_medium\": \"http://pics.com/clubs/1/medium.jpg\"," +
        "  \"profile\": \"http://pics.com/clubs/1/large.jpg\"," +
        "  \"cover_photo\": \"http://pics.com/clubs/1/cover/large.jpg\"," +
        "  \"cover_photo_small\": \"http://pics.com/clubs/1/cover/small.jpg\"," +
        "  \"description\": \"From the people who brought you strava.com\"," +
        "  \"club_type\": \"company\"," +
        "  \"sport_type\": \"cycling\"," +
        "  \"city\": \"San Francisco\"," +
        "  \"state\": \"California\"," +
        "  \"country\": \"United States\"," +
        "  \"private\": true," +
        "  \"member_count\": 71," +
        "  \"featured\": false," +
        "  \"verified\": false," +
        "  \"membership\": \"member\"," +
        "  \"admin\": true," +
        "  \"owner\": false," +
        "  \"following_count\": 1," +
        "  \"url\": \"strava-cycling\"" +
    "}"
    
    let ANNOUNCEMENTS_JSON = "[" +
        "  {" +
        "    \"id\": 1219827," +
        "    \"resource_state\": 2," +
        "    \"club_id\": 109984," +
        "    \"athlete\": {" +
        "      \"id\": 227615," +
        "      \"resource_state\": 2," +
        "      \"firstname\": \"John\"," +
        "      \"lastname\": \"Applestrava\"," +
        "      \"profile_medium\": \"http://pics.com/227615/medium.jpg\"," +
        "      \"profile\": \"http://pics.com/227615/large.jpg\"," +
        "      \"city\": \"San Francisco\"," +
        "      \"state\": \"California\"," +
        "      \"country\": \"United States\"," +
        "      \"sex\": \"M\"," +
        "      \"friend\": \"accepted\"," +
        "      \"follower\": \"accepted\"," +
        "      \"premium\": true," +
        "      \"created_at\": \"2009-08-26T13:42:05Z\"," +
        "      \"updated_at\": \"2013-01-11T18:51:00Z\"" +
        "    }," +
        "    \"created_at\": \"2015-04-01T21:14:02Z\"," +
        "    \"message\": \"hello club\"" +
        "  }" +
    "]"
    
    let EVENTS_JSON = "[" +
        "  {" +
        "    \"id\": 1234567," +
        "    \"resource_state\": 2," +
        "    \"title\": \"Test Group Event\"," +
        "    \"description\": \"Very fun group ride\"," +
        "    \"club_id\": 1," +
        "    \"organizing_athlete\": {" +
        "      \"id\": 227615," +
        "      \"resource_state\": 2," +
        "      \"firstname\": \"John\"," +
        "      \"lastname\": \"Applestrava\"," +
        "      \"profile_medium\": \"http://pics.com/227615/medium.jpg\"," +
        "      \"profile\": \"http://pics.com/227615/large.jpg\"," +
        "      \"city\": \"San Francisco\"," +
        "      \"state\": \"California\"," +
        "      \"country\": \"United States\"," +
        "      \"sex\": \"M\"," +
        "      \"friend\": \"accepted\"," +
        "      \"follower\": \"accepted\"," +
        "      \"premium\": true," +
        "      \"created_at\": \"2009-08-26T13:42:05Z\"," +
        "      \"updated_at\": \"2013-01-11T18:51:00Z\"" +
        "    }," +
        "    \"activity_type\": \"Ride\"," +
        "    \"created_at\": \"2009-08-26T13:42:05Z\"," +
        "    \"route_id\": 123456," +
        "    \"women_only\": false," +
        "    \"private\": true," +
        "    \"skill_levels\": 1," +
        "    \"terrain\": 0," +
        "    \"upcoming_occurrences\": [" +
        "      \"2015-04-19T18:47:59Z\"," +
        "      \"2015-04-20T18:47:59Z\"," +
        "      \"2015-04-21T18:47:59Z\"," +
        "      \"2015-04-22T18:47:59Z\"," +
        "      \"2015-04-23T18:47:59Z\"" +
        "    ]," +
        "    \"address\": \"1 Happening St. Reno, NV\"" +
        "  }" +
    "]"
}
