//
//  EventParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class EventParserTest: XCTestCase {
    
    func testJSONisParsedToEvent() {
        let json = JSON.parse("  {" +
            "    \"id\": 1234567," +
            "    \"resource_state\": 2," +
            "    \"title\": \"Test Group Event\"," +
            "    \"description\": \"Very fun group ride\"," +
            "    \"club_id\": 1," +
            "    \"organizing_athlete\": {" +
            "      \"id\": 227615," +
            "      \"resource_state\": 1" +
            "    }," +
            "    \"activity_type\": \"Ride\"," +
            "    \"created_at\": \"2009-08-26T13:42:05Z\"," +
            "    \"route_id\": 123456," +
            "    \"women_only\": false," +
            "    \"private\": true," +
            "    \"skill_levels\": 1," +
            "    \"terrain\": 0," +
            "    \"upcoming_occurrences\": [" +
            "      \"2015-04-19T00:00:00Z\"," +
            "      \"2015-04-20T00:00:00Z\"," +
            "      \"2015-04-21T00:00:00Z\"," +
            "      \"2015-04-22T00:00:00Z\"," +
            "      \"2015-04-23T00:00:00Z\"" +
            "    ]," +
            "    \"address\": \"1 Happening St. Reno, NV\"" +
            "  }")
        let parser = EventParser()
        
        let result = parser.from(json: json)
        let expected = Event(id: 1234567,
                             resourceState: .summary,
                             title: "Test Group Event",
                             description: "Very fun group ride",
                             clubID: 1,
                             organizingAthlete: Athlete(id: 227615, resourceState: .meta, firstName: nil, lastName: nil, profileMedium: nil, profile: nil, city: nil, state: nil, country: nil, sex: nil, friend: nil, follower: nil, isPremium: nil, createdAt: nil, updatedAt: nil, followerCount: nil, friendCount: nil, mutualFriendCount: nil, athleteType: nil, datePreference: nil, measurementPreference: nil, email: nil, ftp: nil, weight: nil, clubs: nil, bikes: nil, shoes: nil),
                             activityType: .ride,
                             createdAt: Date(day: 26, month: 8, year: 2009, hour: 13, minute: 42, second: 05),
                             routeID: 123456,
                             isWomanOnly: false,
                             isPrivate: true,
                             skillLevel: .casual,
                             terrain: .mostlyFlat,
                             upcomingOccurrences: EquatableArray(array: [ Date(day: 19, month: 4, year: 2015), Date(day: 20, month: 4, year: 2015), Date(day: 21, month: 4, year: 2015), Date(day: 22, month: 4, year: 2015), Date(day: 23, month: 4, year: 2015) ]),
                             address: "1 Happening St. Reno, NV")
        
        expect(result).to(equal(expected))
    }
    
}
