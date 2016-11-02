//
//  SegmentParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class SegmentParser : Parser {
    private let distanceParser = DistanceParser()
    private let percentageParser = PercentageParser()
    private let coordinatesParser = CoordinatesParser()
    private let dateParser = DateParser()
    
    public func from(json : JSON) -> Segment {
        return Segment(id: json["id"].int!,
                       resourceState: ResourceStateParser().from(json: json["resource_state"]),
                       name: json["name"].string!,
                       activityType: json["activity_type"].exists() ? ActivityTypeParser().from(json: json["activity_type"]) : nil,
                       distance: json["distance"].exists() ? distanceParser.from(json: json["distance"]) : nil,
                       averageGrade: json["average_grade"].exists() ? percentageParser.from(json: json["average_grade"]) : nil,
                       maximumGrade: json["maximum_grade"].exists() ? percentageParser.from(json: json["maximum_grade"]) : nil,
                       elevationHigh: json["elevation_high"].exists() ? distanceParser.from(json: json["elevation_high"]) : nil,
                       elevationLow: json["elevation_low"].exists() ? distanceParser.from(json: json["elevation_low"]) : nil,
                       startCoordinates: json["start_latlng"].exists() ? coordinatesParser.from(json: json["start_latlng"]) : nil,
                       endCoordinates: json["end_latlng"].exists() ? coordinatesParser.from(json: json["end_latlng"]) : nil,
                       climbCategory: json["climb_category"].int,
                       city: json["city"].string,
                       state: json["state"].string,
                       country: json["country"].string,
                       isPrivate: json["private"].bool,
                       isStarred: json["starred"].bool,
                       isHazardous: json["hazardous"].bool,
                       createdAt: !json["created_at"].exists() ? nil : dateParser.from(json: json["created_at"]),
                       updatedAt: !json["updated_at"].exists() ? nil : dateParser.from(json: json["updated_at"]),
                       totalElevationGain: !json["total_elevation_gain"].exists() ? nil : distanceParser.from(json: json["total_elevation_gain"]),
                       map: !json["map"].exists() ? nil : MapParser().from(json: json["map"]),
                       effortCount: json["effort_count"].int,
                       athleteCount: json["athlete_count"].int,
                       starCount: json["star_count"].int)
    }
}
