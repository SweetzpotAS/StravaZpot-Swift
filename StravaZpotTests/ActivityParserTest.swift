//
//  ActivityParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ActivityParserTest: XCTestCase {
    
    func testJSONisParsedToActivity() {
        let json = JSON.parse("{\n" +
            "  \"id\": 321934,\n" +
                "  \"resource_state\": 3,\n" +
                "  \"external_id\": \"2012-12-12_21-40-32-80-29011.fit\",\n" +
                "  \"upload_id\": 361720,\n" +
                "  \"name\": \"Evening Ride\",\n" +
                "  \"description\": \"the best ride ever\",\n" +
                "  \"distance\": 4475.4,\n" +
                "  \"moving_time\": 1303,\n" +
                "  \"elapsed_time\": 1333,\n" +
                "  \"total_elevation_gain\": 154.5,\n" +
                "  \"elev_high\": 331.4,\n" +
                "  \"elev_low\": 276.1,\n" +
                "  \"type\": \"Run\",\n" +
                "  \"start_date\": \"2012-12-13T03:43:19Z\",\n" +
                "  \"start_date_local\": \"2012-12-12T19:43:19Z\",\n" +
                "  \"timezone\": \"(GMT-08:00) America/Los_Angeles\",\n" +
                "  \"start_latlng\": [\n" +
                "    37.8,\n" +
                "    -122.27\n" +
                "  ],\n" +
                "  \"end_latlng\": [\n" +
                "    37.8,\n" +
                "    -122.27\n" +
                "  ],\n" +
                "  \"achievement_count\": 6,\n" +
                "  \"kudos_count\": 1,\n" +
                "  \"comment_count\": 1,\n" +
                "  \"athlete_count\": 1,\n" +
                "  \"photo_count\": 0,\n" +
                "  \"total_photo_count\": 0,\n" +
                "  \"trainer\": false,\n" +
                "  \"commute\": false,\n" +
                "  \"manual\": false,\n" +
                "  \"private\": false,\n" +
                "  \"flagged\": false,\n" +
                "  \"workout_type\": 2,\n" +
                "  \"average_speed\": 3.4,\n" +
                "  \"max_speed\": 4.514,\n" +
                "  \"calories\": 390.5,\n" +
                "  \"has_kudoed\": false,\n" +
                "  \"splits_metric\": [\n" +
                "    {\n" +
                "      \"distance\": 1002.5,\n" +
                "      \"elapsed_time\": 276,\n" +
                "      \"elevation_difference\": 0,\n" +
                "      \"moving_time\": 276,\n" +
                "      \"split\": 1\n" +
                "    }\n" +
                "  ],\n" +
                "  \"splits_standard\": [\n" +
                "    {\n" +
                "      \"distance\": 1002.5,\n" +
                "      \"elapsed_time\": 276,\n" +
                "      \"elevation_difference\": 0,\n" +
                "      \"moving_time\": 276,\n" +
                "      \"split\": 1\n" +
                "    }\n" +
                "  ]\n" +
            "}")
        let parser = ActivityParser()
        
        let result = parser.from(json: json)
        let expected = Activity(id: 321934,
                                resourceState: .detailed,
                                externalID: "2012-12-12_21-40-32-80-29011.fit",
                                uploadID: 361720,
                                athlete: nil,
                                name: "Evening Ride",
                                description: "the best ride ever",
                                distance: Distance(meters: 4475.4),
                                movingTime: Time(seconds: 1303),
                                elapsedTime: Time(seconds: 1333),
                                totalElevationGain: Distance(meters: 154.5),
                                elevationHigh: Distance(meters: 331.4),
                                elevationLow: Distance(meters: 276.1),
                                type: .run,
                                startDate: Date(day: 13, month: 12, year: 2012, hour: 3, minute: 43, second: 19),
                                startDateLocal: Date(day: 12, month: 12, year: 2012, hour: 19, minute: 43, second: 19),
                                timezone: "(GMT-08:00) America/Los_Angeles",
                                startCoordinates: Coordinates(latitude: 37.8, longitude: -122.27),
                                endCoordinates: Coordinates(latitude: 37.8, longitude: -122.27),
                                achievementCount: 6,
                                kudosCount: 1,
                                commentCount: 1,
                                athleteCount: 1,
                                photoCount: 0,
                                totalPhotoCount: 0,
                                photos: nil,
                                map: nil,
                                hasTrainer: false,
                                isCommute: false,
                                isManual: false,
                                isPrivate: false,
                                deviceName: nil,
                                embedToken: nil,
                                isFlagged: false,
                                workoutType: WorkoutType.longRun,
                                gearID: nil,
                                gear: nil,
                                averageSpeed: Speed(metersPerSecond: 3.4),
                                maxSpeed: Speed(metersPerSecond: 4.514),
                                averageCadence: nil,
                                averageTemperature: nil,
                                averageWatts: nil,
                                maxWatts: nil,
                                weightedAverageWatts: nil,
                                kilojoules: nil,
                                hasDeviceWatts: nil,
                                hasHeartRate: nil,
                                averageHeartRate: nil,
                                maxHeartRate: nil,
                                calories: 390.5,
                                sufferScore: nil,
                                hasKudoed: false,
                                splitsMetric: EquatableArray(array: [ Split(distance: Distance(meters: 1002.5), elevationDifference: Distance(meters: 0), elapsedTime: Time(seconds: 276), movingTime: Time(seconds: 276), split: 1)]),
                                splitsStandard: EquatableArray(array: [ Split(distance: Distance(meters: 1002.5), elevationDifference: Distance(meters: 0), elapsedTime: Time(seconds: 276), movingTime: Time(seconds: 276), split: 1)]),
                                segmentEfforts: nil,
                                bestEfforts: nil)
        
        expect(result).to(equal(expected))
    }
    
}
