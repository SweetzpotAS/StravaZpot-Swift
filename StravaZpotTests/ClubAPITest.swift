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
}
