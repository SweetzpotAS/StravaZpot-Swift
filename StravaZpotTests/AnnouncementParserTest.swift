//
//  AnnouncementParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class AnnouncementParserTest: XCTestCase {
    
    func testJSONisParsedToAnnouncement() {
        let json = JSON.parse("  {" +
            "    \"id\": 1219827," +
            "    \"resource_state\": 2," +
            "    \"club_id\": 109984," +
            "    \"athlete\": {" +
            "      \"id\": 227615," +
            "      \"resource_state\": 1" +
            "    }," +
            "    \"created_at\": \"2015-04-01T21:14:02Z\"," +
            "    \"message\": \"hello club\"" +
            "  }")
        let parser = AnnouncementParser()
        
        let result = parser.from(json: json)
        let expected = Announcement(id: 1219827,
                                    resourceState: .summary,
                                    clubID: 109984,
                                    athlete: Athlete(id: 227615, resourceState: .meta, firstName: nil, lastName: nil, profileMedium: nil, profile: nil, city: nil, state: nil, country: nil, sex: nil, friend: nil, follower: nil, isPremium: nil, createdAt: nil, updatedAt: nil, followerCount: nil, friendCount: nil, mutualFriendCount: nil, athleteType: nil, datePreference: nil, measurementPreference: nil, email: nil, ftp: nil, weight: nil, clubs: nil, bikes: nil, shoes: nil),
                                    createdAt: Date(day: 1, month: 4, year: 2015, hour: 21, minute: 14, second: 2),
                                    message: "hello club")
        
        expect(result).to(equal(expected))
    }
    
}
