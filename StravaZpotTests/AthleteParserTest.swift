//
//  AthleteParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class AthleteParserTest: XCTestCase {
    
    func testJSONisParsedToAthlete() {
        let json = JSON.parse("{" +
                "  \"id\": 227615," +
                "  \"resource_state\": 3," +
                "  \"firstname\": \"John\"," +
                "  \"lastname\": \"Applestrava\"," +
                "  \"profile_medium\": \"http://pics.com/227615/medium.jpg\"," +
                "  \"profile\": \"http://pics.com/227615/large.jpg\"," +
                "  \"city\": \"San Francisco\"," +
                "  \"state\": \"California\"," +
                "  \"country\": \"United States\"," +
                "  \"sex\": \"M\"," +
                "  \"friend\": null," +
                "  \"follower\": null," +
                "  \"premium\": true," +
                "  \"created_at\": \"2008-01-01T17:44:00Z\"," +
                "  \"updated_at\": \"2013-09-04T20:00:50Z\"," +
                "  \"follower_count\": 273," +
                "  \"friend_count\": 19," +
                "  \"mutual_friend_count\": 0," +
                "  \"athlete_type\": 0," +
                "  \"date_preference\": \"%m/%d/%Y\"," +
                "  \"measurement_preference\": \"feet\"," +
                "  \"email\": \"john@applestrava.com\"," +
                "  \"ftp\": 280," +
                "  \"weight\": 68.7," +
                "  \"clubs\": []," +
                "  \"bikes\": []," +
                "  \"shoes\": []" +
            "}")
        let parser = AthleteParser()
        
        let result = parser.from(json: json)
        let expected = Athlete(id: 227615,
                               resourceState: .detailed,
                               firstName: "John",
                               lastName: "Applestrava",
                               profileMedium: "http://pics.com/227615/medium.jpg",
                               profile: "http://pics.com/227615/large.jpg",
                               city: "San Francisco",
                               state: "California",
                               country: "United States",
                               sex: .male,
                               friend: FriendStatus.not_friends,
                               follower: FriendStatus.not_friends,
                               isPremium: true,
                               createdAt: Date(day: 1, month: 1, year: 2008, hour: 17, minute: 44, second: 0),
                               updatedAt: Date(day: 4, month: 9, year: 2013, hour: 20, minute: 0, second: 50),
                               followerCount: 273,
                               friendCount: 19,
                               mutualFriendCount: 0,
                               athleteType: AthleteType.cyclist,
                               datePreference: "%m/%d/%Y",
                               measurementPreference: .feet,
                               email: "john@applestrava.com",
                               ftp: 280,
                               weight: 68.7,
                               clubs: EquatableArray<Club>(array: []),
                               bikes: EquatableArray<Gear>(array: []),
                               shoes: EquatableArray<Gear>(array: []))
        
        expect(result).to(equal(expected))
    }
    
}
