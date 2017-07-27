//
//  SegmentParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class SegmentParserTest: XCTestCase {
    
    func testJSONisParsedToSegment() {
        let json = JSON.parse("{" +
            "  \"id\": 229781," +
            "  \"resource_state\": 3," +
            "  \"name\": \"Hawk Hill\"," +
            "  \"activity_type\": \"Ride\"," +
            "  \"distance\": 2684.82," +
            "  \"average_grade\": 5.7," +
            "  \"maximum_grade\": 14.2," +
            "  \"elevation_high\": 245.3," +
            "  \"elevation_low\": 92.4," +
            "  \"start_latlng\": [" +
            "    37.8331119," +
            "    -122.4834356" +
            "  ]," +
            "  \"end_latlng\": [" +
            "    37.8280722," +
            "    -122.4981393" +
            "  ]," +
            "  \"climb_category\": 1," +
            "  \"city\": \"San Francisco\"," +
            "  \"state\": \"CA\"," +
            "  \"country\": \"United States\"," +
            "  \"private\": false," +
            "  \"starred\": false," +
            "  \"created_at\": \"2008-01-01T17:44:00Z\"," +
            "  \"updated_at\": \"2013-09-04T20:00:50Z\"," +
            "  \"effort_count\": 51335," +
            "  \"athlete_count\": 7036," +
            "  \"hazardous\": false," +
            "  \"star_count\": 0" +
            "}")
        let parser = SegmentParser()
        
        let result = parser.from(json: json)
        let expected = Segment(id: 229781,
                               resourceState: .detailed,
                               name: "Hawk Hill",
                               activityType: .ride,
                               distance: Distance(meters: 2684.82),
                               averageGrade: Percentage(percent: 5.7),
                               maximumGrade: Percentage(percent: 14.2),
                               elevationHigh: Distance(meters: 245.3),
                               elevationLow: Distance(meters: 92.4),
                               startCoordinates: Coordinates(latitude: 37.8331119, longitude: -122.4834356),
                               endCoordinates: Coordinates(latitude: 37.8280722, longitude: -122.4981393),
                               climbCategory: 1,
                               city: "San Francisco",
                               state: "CA",
                               country: "United States",
                               isPrivate: false,
                               isStarred: false,
                               isHazardous: false,
                               createdAt: Date(day: 1, month: 1, year: 2008, hour: 17, minute: 44, second: 0),
                               updatedAt: Date(day: 4, month: 9, year: 2013, hour: 20, minute: 0, second: 50),
                               totalElevationGain: nil,
                               map: nil,
                               effortCount: 51335,
                               athleteCount: 7036,
                               starCount: 0)
        
        expect(result).to(equal(expected))
    }
    
}
