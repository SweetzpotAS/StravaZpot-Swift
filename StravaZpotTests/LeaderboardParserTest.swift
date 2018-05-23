//
//  LeaderboardParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class LeaderboardParserTest: XCTestCase {
    
    func testJSONisParsedToLeaderboard() {
        let json = JSON(parseJSON: "{" +
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
            "    }" +
            "  ]" +
            "}")
        let parser = LeaderboardParser()
        
        let result = parser.from(json: json)
        let expected = Leaderboard(entryCount: 7037, entries: EquatableArray(array: [
                LeaderboardEntry(athleteID: 123529,
                             athleteName: "Jim Whimpey",
                             athleteGender: .male,
                             averageHeartRate: 190.5,
                             averageWatts: 460.8,
                             distance: Distance(meters: 2659.89),
                             elapsedTime: Time(seconds: 360),
                             movingTime: Time(seconds: 360),
                             startDate: Date(day: 29, month: 3, year: 2013, hour: 13, minute: 49, second: 35),
                             stardDateLocal: Date(day: 29, month: 3, year: 2013, hour: 6, minute: 49, second: 35),
                             activityID: 46320211,
                             effortID: 801006623,
                             rank: 1,
                             athleteProfile: "http://pics.com/227615/large.jpg")
            ]))
        
        expect(result).to(equal(expected))
    }
    
}
