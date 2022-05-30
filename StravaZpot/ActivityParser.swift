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
                        distance: json["distance"].distance,
                        movingTime: json["moving_time"].time,
                        elapsedTime: json["elapsed_time"].time,
                        totalElevationGain: json["total_elevation_gain"].distance,
                        elevationHigh: json["elev_high"].distance,
                        elevationLow: json["elev_low"].distance,
                        type: json["type"].activityType,
                        startDate: json["start_date"].date,
                        startDateLocal: json["start_date_local"].date,
                        timezone: json["timezone"].string,
                        startCoordinates: json["start_latlng"].coordinates,
                        endCoordinates: json["end_latlng"].coordinates,
                        achievementCount: json["achievement_count"].int,
                        kudosCount: json["kudos_count"].int,
                        commentCount: json["comment_count"].int,
                        athleteCount: json["athlete_count"].int,
                        photoCount: json["photo_count"].int,
                        totalPhotoCount: json["total_photo_count"].int,
                        photos: nil,
                        map: json["map"].map,
                        hasTrainer: json["trainer"].bool,
                        isCommute: json["commute"].bool,
                        isManual: json["manual"].bool,
                        isPrivate: json["private"].bool,
                        deviceName: json["device_name"].string,
                        embedToken: json["embed_token"].string,
                        isFlagged: json["flagged"].bool,
                        workoutType: json["workout_type"].workoutType,
                        gearID: json["gear_id"].string,
                        gear: json["gear"].gear,
                        averageSpeed: json["average_speed"].speed,
                        maxSpeed: json["max_speed"].speed,
                        averageCadence: json["average_cadence"].double,
                        averageTemperature: json["average_temperature"].temperature,
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
                        splitsMetric: json["splits_metric"].splitArray,
                        splitsStandard: json["splits_standard"].splitArray,
                        segmentEfforts: json["segment_efforts"].segmentEffortArray,
                        bestEfforts: json["best_efforts"].segmentEffortArray)
    }
}
