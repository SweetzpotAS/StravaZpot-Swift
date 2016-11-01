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
                       activityType: ActivityTypeParser().from(json: json["activity_type"]),
                       distance: distanceParser.from(json: json["distance"]),
                       averageGrade: percentageParser.from(json: json["average_grade"]),
                       maximumGrade: percentageParser.from(json: json["maximum_grade"]),
                       elevationHigh: distanceParser.from(json: json["elevation_high"]),
                       elevationLow: distanceParser.from(json: json["elevation_low"]),
                       startCoordinates: coordinatesParser.from(json: json["start_latlng"]),
                       endCoordinates: coordinatesParser.from(json: json["end_latlng"]),
                       climbCategory: json["climb_category"].int!,
                       city: json["city"].string!,
                       state: json["state"].string!,
                       country: json["country"].string!,
                       isPrivate: json["private"].bool!,
                       isStarred: json["starred"].bool!,
                       isHazardous: json["hazardous"].bool!,
                       createdAt: !json["created_at"].exists() ? nil : dateParser.from(json: json["created_at"]),
                       updatedAt: !json["updated_at"].exists() ? nil : dateParser.from(json: json["updated_at"]),
                       totalElevationGain: !json["total_elevation_gain"].exists() ? nil : distanceParser.from(json: json["total_elevation_gain"]),
                       map: !json["map"].exists() ? nil : MapParser().from(json: json["map"]),
                       effortCount: json["effort_count"].int,
                       athleteCount: json["athlete_count"].int,
                       starCount: json["star_count"].int)
    }
}
