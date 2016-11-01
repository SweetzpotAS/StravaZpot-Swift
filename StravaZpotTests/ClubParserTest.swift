//
//  ClubParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ClubParserTest: XCTestCase {
    
    func testJSONisParsedToClub() {
        let json = JSON.parse("{" +
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
            "}")
        let parser = ClubParser()
        
        let result = parser.from(json: json)
        let expected = Club(id: 1,
                            resourceState: .detailed,
                            name: "Team Strava Cycling",
                            profileMedium: "http://pics.com/clubs/1/medium.jpg",
                            profile: "http://pics.com/clubs/1/large.jpg",
                            coverPhoto: "http://pics.com/clubs/1/cover/large.jpg",
                            coverPhotoSmall: "http://pics.com/clubs/1/cover/small.jpg",
                            sportType: .cycling,
                            city: "San Francisco",
                            state: "California",
                            country: "United States",
                            isPrivate: true,
                            memberCount: 71,
                            isFeatured: false,
                            isVerified: false,
                            url: "strava-cycling",
                            description: "From the people who brought you strava.com",
                            clubType: .company,
                            membership: .member,
                            isAdmin: true,
                            isOwner: false,
                            followingCount: 1)
        
        expect(result).to(equal(expected))
    }
    
}
