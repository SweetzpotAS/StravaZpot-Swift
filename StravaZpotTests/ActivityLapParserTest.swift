//
//  ActivityLapParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ActivityLapParserTest: XCTestCase {
    
    func testJSONisParsedToActivityLap() {
        let json = JSON.parse("  {" +
            "    \"id\": 401614652," +
            "    \"resource_state\": 2," +
            "    \"name\": \"Lap 1\"," +
            "    \"activity\": {" +
            "      \"id\": 123" +
            "    }," +
            "    \"athlete\": {" +
            "      \"id\": 227615" +
            "    }," +
            "    \"elapsed_time\": 7092," +
            "    \"moving_time\": 6870," +
            "    \"start_date\": \"2013-11-02T17:39:37Z\"," +
            "    \"start_date_local\": \"2013-11-02T10:39:37Z\"," +
            "    \"distance\": 42121.5," +
            "    \"start_index\": 0," +
            "    \"end_index\": 6826," +
            "    \"total_elevation_gain\": 766.0," +
            "    \"average_speed\": 5.9," +
            "    \"max_speed\": 16.8," +
            "    \"average_cadence\": 64.7," +
            "    \"average_watts\": 156.2," +
            "    \"device_watts\": false," +
            "    \"has_heartrate\": true," +
            "    \"average_heartrate\": 141.0," +
            "    \"max_heartrate\": 176.0," +
            "    \"lap_index\": 1" +
            "  }")
        let parser = ActivityLapParser()
        
        let result = parser.from(json: json)
        let expected = ActivityLap(id: 401614652,
                                   resourceState: .summary,
                                   name: "Lap 1",
                                   activity: Activity(id: 123, resourceState: .meta, externalID: nil, uploadID: nil, athlete: nil, name: nil, description: nil, distance: nil, movingTime: nil, elapsedTime: nil, totalElevationGain: nil, elevationHigh: nil, elevationLow: nil, type: nil, startDate: nil, startDateLocal: nil, timezone: nil, startCoordinates: nil, endCoordinates: nil, achievementCount: nil, kudosCount: nil, commentCount: nil, athleteCount: nil, photoCount: nil, totalPhotoCount: nil, photos: nil, map: nil, hasTrainer: nil, isCommute: nil, isManual: nil, isPrivate: nil, deviceName: nil, embedToken: nil, isFlagged: nil, workoutType: nil, gearID: nil, gear: nil, averageSpeed: nil, maxSpeed: nil, averageCadence: nil, averageTemperature: nil, averageWatts: nil, maxWatts: nil, weightedAverageWatts: nil, kilojoules: nil, hasDeviceWatts: nil, hasHeartRate: nil, averageHeartRate: nil, maxHeartRate: nil, calories: nil, sufferScore: nil, hasKudoed: nil, splitsMetric: nil, splitsStandard: nil, segmentEfforts: nil, bestEfforts: nil),
                                   athlete: Athlete(id: 227615, resourceState: .meta, firstName: nil, lastName: nil, profileMedium: nil, profile: nil, city: nil, state: nil, country: nil, sex: nil, friend: nil, follower: nil, isPremium: nil, createdAt: nil, updatedAt: nil, followerCount: nil, friendCount: nil, mutualFriendCount: nil, athleteType: nil, datePreference: nil, measurementPreference: nil, email: nil, ftp: nil, weight: nil, clubs: nil, bikes: nil, shoes: nil),
                                   elapsedTime: Time(seconds: 7092),
                                   movingTime: Time(seconds: 6870),
                                   startDate: Date(day: 2, month: 11, year: 2013, hour: 17, minute: 39, second: 37),
                                   startDateLocal: Date(day: 2, month: 11, year: 2013, hour: 10, minute: 39, second: 37),
                                   distance: Distance(meters: 42121.5),
                                   startIndex: 0,
                                   endIndex: 6826,
                                   totalElevationGain: Distance(meters: 766),
                                   averageSpeed: Speed(metersPerSecond: 5.9),
                                   maxSpeed: Speed(metersPerSecond: 16.8),
                                   averageCadence: 64.7,
                                   averageWatts: 156.2,
                                   hasDeviceWatts: false,
                                   hasHeartRate: true,
                                   maxHeartRate: 176,
                                   averageHeartRate: 141,
                                   lapIndex: 1)
        
        expect(result).to(equal(expected))
    }
    
}
