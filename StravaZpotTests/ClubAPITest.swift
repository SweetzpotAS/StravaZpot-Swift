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
    
    func testShouldListAthleteClubs() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = ClubAPI(client: client)
        
        var result : StravaResult<EquatableArray<Club>>?
        api.listAthleteClubs().execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athlete/clubs"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldListClubMembers() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = ClubAPI(client: client)
        
        var result : StravaResult<EquatableArray<Athlete>>?
        api.listClubMembers(withID: 123).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("clubs/123/members"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldListClubAdmins() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = ClubAPI(client: client)
        
        var result : StravaResult<EquatableArray<Athlete>>?
        api.listClubAdmins(withID: 123).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("clubs/123/admins"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldListClubActivities() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = ClubAPI(client: client)
        
        var result : StravaResult<EquatableArray<Activity>>?
        api.listClubActivities(withID: 123, before: 9999).of(page: 2, itemsPerPage: 10).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("clubs/123/activities"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["before"] as! Int?).to(equal(9999))
        expect(client.lastParameters["page"] as! Int?).to(equal(2))
        expect(client.lastParameters["per_page"] as! Int?).to(equal(10))
    }
    
    func testShouldJoinAClub() {
        let client = MockHTTPClient(respondWithJSON: JOIN_JSON)
        let api = ClubAPI(client: client)
        
        var result : StravaResult<JoinResult>?
        api.joinClub(withID: 123).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("clubs/123/join"))
        expect(client.postCalled).to(equal(true))
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
    
    let JOIN_JSON = "{" +
        "  \"success\": true," +
        "  \"active\": true," +
        "  \"membership\": \"member\"" +
    "}"
}
