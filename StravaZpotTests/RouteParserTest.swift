//
//  RouteParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class RouteParserTest: XCTestCase {
    
    func testJSONisParsedToRoute() {
        let json = JSON.parse("{" +
            "  \"athlete\": {" +
            "    \"id\": 265720," +
            "    \"resource_state\": 1" +
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
            "}")
        let parser = RouteParser()
        
        let result = parser.from(json: json)
        let expected = Route(id: 1263727,
                             resourceState: .detailed,
                             name: "New Years Resolution - Santa Cruz Century Edition",
                             description: "",
                             athlete: Athlete(id: 265720, resourceState: .meta, firstName: nil, lastName: nil, profileMedium: nil, profile: nil, city: nil, state: nil, country: nil, sex: nil, friend: nil, follower: nil, isPremium: nil, createdAt: nil, updatedAt: nil, followerCount: nil, friendCount: nil, mutualFriendCount: nil, athleteType: nil, datePreference: nil, measurementPreference: nil, email: nil, ftp: nil, weight: nil, clubs: nil, bikes: nil, shoes: nil),
                             distance: Distance(meters: 173625.6),
                             elevationGain: Distance(meters: 2964.6),
                             map: Map(id: "r1263727", resourceState: .detailed, summaryPolyline: "qyrFxswgV|"),
                             type: RouteType.ride,
                             subtype: RouteSubtype.mtb,
                             isPrivate: false,
                             isStarred: false,
                             timestamp: 1419669292,
                             segments: EquatableArray(array: [Segment(id: 3799, resourceState: .summary, name: "Highway 9 - HWY236 to Skyline", activityType: nil, distance: nil, averageGrade: nil, maximumGrade: nil, elevationHigh: nil, elevationLow: nil, startCoordinates: nil, endCoordinates: nil, climbCategory: nil, city: nil, state: nil, country: nil, isPrivate: nil, isStarred: nil, isHazardous: nil, createdAt: nil, updatedAt: nil, totalElevationGain: nil, map: nil, effortCount: nil, athleteCount: nil, starCount: nil)]))
        
        expect(result).to(equal(expected))
    }
    
}
