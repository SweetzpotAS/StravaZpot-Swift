//
//  ActivityParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ActivityParser : Parser {
    public func from(json: JSON) -> Activity {
        return Activity(id: json["id"].int!,
                        resourceState: json["resource_state"].resourceState!,
                        externalID: json["external_id"].string,
                        uploadID: json["upload_id"].int,
                        athlete: json["athlete"].athlete,
                        name: json["name"].string,
                        description: json["description"].string,
                        distance: json["distance"].exists() ? DistanceParser().from(json: json["distance"]) : nil,
                        movingTime: json["moving_time"].time,
                        elapsedTime: json["elapsed_time"].time,
                        totalElevationGain: json["total_elevation_gain"].exists() ? DistanceParser().from(json: json["total_elevation_gain"]) : nil ,
                        elevationHigh: json["elev_high"].exists() ? DistanceParser().from(json: json["elev_high"]) : nil,
                        elevationLow: json["elev_low"].exists() ? DistanceParser().from(json: json["elev_low"]) : nil,
                        type: json["type"].exists() ? ActivityTypeParser().from(json: json["type"]) : nil,
                        startDate: json["start_date"].exists() ? DateParser().from(json: json["start_date"]) : nil,
                        startDateLocal: json["start_date_local"].exists() ? DateParser().from(json: json["start_date_local"]) : nil,
                        timezone: json["timezone"].string,
                        startCoordinates: json["start_latlng"].exists() ? CoordinatesParser().from(json: json["start_latlng"]) : nil,
                        endCoordinates: json["end_latlng"].exists() ? CoordinatesParser().from(json: json["end_latlng"]) : nil,
                        achievementCount: json["achievement_count"].int,
                        kudosCount: json["kudos_count"].int,
                        commentCount: json["comment_count"].int,
                        athleteCount: json["athlete_count"].int,
                        photoCount: json["photo_count"].int,
                        totalPhotoCount: json["total_photo_count"].int,
                        photos: json["photos"].exists() ? PhotoSummaryParser().from(json: json["photos"]) : nil,
                        map: json["map"].exists() ? MapParser().from(json: json["map"]) : nil,
                        hasTrainer: json["trainer"].bool,
                        isCommute: json["commute"].bool,
                        isManual: json["manual"].bool,
                        isPrivate: json["private"].bool,
                        deviceName: json["device_name"].string,
                        embedToken: json["embed_token"].string,
                        isFlagged: json["flagged"].bool,
                        workoutType: json["workout_type"].exists() ? WorkoutTypeParser().from(json: json["workout_type"]) : nil,
                        gearID: json["gear_id"].string,
                        gear: json["gear"].exists() ? GearParser().from(json: json["gear"]) : nil,
                        averageSpeed: json["average_speed"].exists() ? SpeedParser().from(json: json["average_speed"]) : nil,
                        maxSpeed: json["max_speed"].exists() ? SpeedParser().from(json: json["max_speed"]) : nil,
                        averageCadence: json["average_cadence"].double,
                        averageTemperature: json["average_temperature"].exists() ? TemperatureParser().from(json: json["average_temperature"]) : nil,
                        averageWatts: json["average_watts"].double,
                        maxWatts: json["max_watts"].double,
                        weightedAverageWatts: json["weighted_average_watts"].double,
                        kilojoules: json["kilojoules"].double,
                        hasDeviceWatts: json["device_watts"].bool,
                        hasHeartRate: json["has_heartrate"].bool,
                        averageHeartRate: json["average_heartrate"].double,
                        maxHeartRate: json["max_heartrate"].int,
                        calories: json["calories"].double,
                        sufferScore: json["suffer_score"].int,
                        hasKudoed: json["has_kudoed"].bool,
                        splitsMetric: getSplits(json: json["splits_metric"]),
                        splitsStandard: getSplits(json: json["splits_standard"]),
                        segmentEfforts: getEfforts(json: json["segment_efforts"]),
                        bestEfforts: getEfforts(json: json["best_efforts"]))
    }
    
    private func getSplits(json : JSON) -> EquatableArray<Split>? {
        if json.exists() {
            let parser = SplitParser()
            return EquatableArray<Split>(array: json.map { parser.from(json: $1) } )
        } else {
            return nil
        }
    }
    
    private func getEfforts(json : JSON) -> EquatableArray<SegmentEffort>? {
        if json.exists() {
            let parser = SegmentEffortParser()
            return EquatableArray<SegmentEffort>(array: json.map { parser.from(json: $1) } )
        } else {
            return nil
        }
    }
}
