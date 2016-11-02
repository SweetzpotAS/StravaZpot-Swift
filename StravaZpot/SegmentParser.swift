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
    private let percentageParser = PercentageParser()
    private let coordinatesParser = CoordinatesParser()
    
    public func from(json : JSON) -> Segment {
        return Segment(id: json["id"].int!,
                       resourceState: json["resource_state"].resourceState!,
                       name: json["name"].string!,
                       activityType: json["activity_type"].exists() ? ActivityTypeParser().from(json: json["activity_type"]) : nil,
                       distance: json["distance"].distance,
                       averageGrade: json["average_grade"].exists() ? percentageParser.from(json: json["average_grade"]) : nil,
                       maximumGrade: json["maximum_grade"].exists() ? percentageParser.from(json: json["maximum_grade"]) : nil,
                       elevationHigh: json["elevation_high"].distance,
                       elevationLow: json["elevation_low"].distance,
                       startCoordinates: json["start_latlng"].exists() ? coordinatesParser.from(json: json["start_latlng"]) : nil,
                       endCoordinates: json["end_latlng"].exists() ? coordinatesParser.from(json: json["end_latlng"]) : nil,
                       climbCategory: json["climb_category"].int,
                       city: json["city"].string,
                       state: json["state"].string,
                       country: json["country"].string,
                       isPrivate: json["private"].bool,
                       isStarred: json["starred"].bool,
                       isHazardous: json["hazardous"].bool,
                       createdAt: json["created_at"].date,
                       updatedAt: json["updated_at"].date,
                       totalElevationGain: json["total_elevation_gain"].distance,
                       map: !json["map"].exists() ? nil : MapParser().from(json: json["map"]),
                       effortCount: json["effort_count"].int,
                       athleteCount: json["athlete_count"].int,
                       starCount: json["star_count"].int)
    }
}
