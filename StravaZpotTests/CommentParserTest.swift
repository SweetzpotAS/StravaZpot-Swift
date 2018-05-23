//
//  CommentParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class CommentParserTest: XCTestCase {
    
    func testJSONisParsedToComment() {
        let json = JSON(parseJSON: "  {" +
            "    \"id\": 26," +
            "    \"activity_id\": 123," +
            "    \"resource_state\": 2," +
            "    \"text\": \"Nice ride!!!\"," +
            "    \"athlete\": {" +
            "      \"id\": 227615," +
            "      \"resource_state\": 1" +
            "    }," +
            "    \"created_at\": \"2013-09-06T21:07:22Z\"" +
            "  }")
        let parser = CommentParser()
        
        let result = parser.from(json: json)
        let expected = Comment(id: 26,
                               resourceState: .summary,
                               activityID: 123,
                               text: "Nice ride!!!",
                               athlete: Athlete(id: 227615, resourceState: .meta, firstName: nil, lastName: nil, profileMedium: nil, profile: nil, city: nil, state: nil, country: nil, sex: nil, friend: nil, follower: nil, isPremium: nil, createdAt: nil, updatedAt: nil, followerCount: nil, friendCount: nil, mutualFriendCount: nil, athleteType: nil, datePreference: nil, measurementPreference: nil, email: nil, ftp: nil, weight: nil, clubs: nil, bikes: nil, shoes: nil),
                               createdAt: Date(day: 6, month: 9, year: 2013, hour: 21, minute: 7, second: 22))
        
        expect(result).to(equal(expected))
    }
    
}
