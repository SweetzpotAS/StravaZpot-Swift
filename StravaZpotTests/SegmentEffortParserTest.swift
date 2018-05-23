//
//  SegmentEffortParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class SegmentEffortParserTest: XCTestCase {
    
    func testJSONisParsedToSegmentEffort() {
        let json = JSON(parseJSON: "{" +
            "  \"id\": 269990681," +
            "  \"resource_state\": 3," +
            "  \"name\": \"Geysers Road Climb\"," +
            "  \"activity\": {" +
            "    \"id\": 14296826," +
            "    \"resource_state\": 1" +
            "  }," +
            "  \"athlete\": {" +
            "    \"id\": 227615," +
            "    \"resource_state\": 1" +
            "  }," +
            "  \"elapsed_time\": 1137," +
            "  \"moving_time\": 1137," +
            "  \"start_date\": \"2013-03-30T18:43:50Z\"," +
            "  \"start_date_local\": \"2013-03-30T11:43:50Z\"," +
            "  \"distance\": 6001.7," +
            "  \"start_index\": 5348," +
            "  \"end_index\": 6485," +
            "  \"average_cadence\": 79.1," +
            "  \"average_watts\": 357.2," +
            "  \"device_watts\": false," +
            "  \"average_heartrate\": 177.8," +
            "  \"max_heartrate\": 192.0," +
            "  \"segment\": {" +
            "    \"id\": 1818385," +
            "    \"resource_state\": 2," +
            "    \"name\": \"Geysers Road Climb\"," +
            "  }," +
            "  \"kom_rank\": 1," +
            "  \"pr_rank\": 2" +
            "}")
        let parser = SegmentEffortParser()
        
        let result = parser.from(json: json)
        let expected = SegmentEffort(id: 269990681,
                                     resourceState: .detailed,
                                     name: "Geysers Road Climb",
                                     activity: Activity(id: 14296826, resourceState: .meta, externalID: nil, uploadID: nil, athlete: nil, name: nil, description: nil, distance: nil, movingTime: nil, elapsedTime: nil, totalElevationGain: nil, elevationHigh: nil, elevationLow: nil, type: nil, startDate: nil, startDateLocal: nil, timezone: nil, startCoordinates: nil, endCoordinates: nil, achievementCount: nil, kudosCount: nil, commentCount: nil, athleteCount: nil, photoCount: nil, totalPhotoCount: nil, photos: nil, map: nil, hasTrainer: nil, isCommute: nil, isManual: nil, isPrivate: nil, deviceName: nil, embedToken: nil, isFlagged: nil, workoutType: nil, gearID: nil, gear: nil, averageSpeed: nil, maxSpeed: nil, averageCadence: nil, averageTemperature: nil, averageWatts: nil, maxWatts: nil, weightedAverageWatts: nil, kilojoules: nil, hasDeviceWatts: nil, hasHeartRate: nil, averageHeartRate: nil, maxHeartRate: nil, calories: nil, sufferScore: nil, hasKudoed: nil, splitsMetric: nil, splitsStandard: nil, segmentEfforts: nil, bestEfforts: nil),
                                     athlete: Athlete(id: 227615, resourceState: .meta, firstName: nil, lastName: nil, profileMedium: nil, profile: nil, city: nil, state: nil, country: nil, sex: nil, friend: nil, follower: nil, isPremium: nil, createdAt: nil, updatedAt: nil, followerCount: nil, friendCount: nil, mutualFriendCount: nil, athleteType: nil, datePreference: nil, measurementPreference: nil, email: nil, ftp: nil, weight: nil, clubs: nil, bikes: nil, shoes: nil),
                                     elapsedTime: Time(seconds: 1137),
                                     movingTime: Time(seconds: 1137),
                                     startDate: Date(day: 30, month: 3, year: 2013, hour: 18, minute: 43, second: 50),
                                     startDateLocal: Date(day: 30, month: 3, year: 2013, hour: 11, minute: 43, second: 50),
                                     distance: Distance(meters: 6001.7),
                                     startIndex: 5348,
                                     endIndex: 6485,
                                     averageCadence: 79.1,
                                     averageWatts: 357.2,
                                     hasDeviceWatts: false,
                                     averageHeartRate: 177.8,
                                     maxHeartRate: 192.0,
                                     segment: Segment(id: 1818385, resourceState: .summary, name: "Geysers Road Climb", activityType: nil, distance: nil, averageGrade: nil, maximumGrade: nil, elevationHigh: nil, elevationLow: nil, startCoordinates: nil, endCoordinates: nil, climbCategory: nil, city: nil, state: nil, country: nil, isPrivate: nil, isStarred: nil, isHazardous: nil, createdAt: nil, updatedAt: nil, totalElevationGain: nil, map: nil, effortCount: nil, athleteCount: nil, starCount: nil),
                                     komRank: 1,
                                     prRank: 2,
                                     isHidden: nil)
        
        expect(result).to(equal(expected))
    }
    
}
