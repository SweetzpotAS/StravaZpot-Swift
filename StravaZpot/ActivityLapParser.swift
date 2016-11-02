//
//  ActivityLapParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ActivityLapParser : Parser {
    public func from(json: JSON) -> ActivityLap {
        return ActivityLap(id: json["id"].int!,
                           resourceState: json["resource_state"].resourceState!,
                           name: json["name"].string!,
                           activity: ActivityParser().from(json: json["activity"]),
                           athlete: AthleteParser().from(json: json["athlete"]),
                           elapsedTime: TimeParser().from(json: json["elapsed_time"]),
                           movingTime: TimeParser().from(json: json["moving_time"]),
                           startDate: DateParser().from(json: json["start_date"]),
                           startDateLocal: DateParser().from(json: json["start_date_local"]),
                           distance: DistanceParser().from(json: json["distance"]),
                           startIndex: json["start_index"].int!,
                           endIndex: json["end_index"].int!,
                           totalElevationGain: DistanceParser().from(json: json["total_elevation_gain"]),
                           averageSpeed: SpeedParser().from(json: json["average_speed"]),
                           maxSpeed: SpeedParser().from(json: json["max_speed"]),
                           averageCadence: json["average_cadence"].double!,
                           averageWatts: json["average_watts"].double!,
                           hasDeviceWatts: json["device_watts"].bool!,
                           hasHeartRate: json["has_heartrate"].bool!,
                           maxHeartRate: json["max_heartrate"].double!,
                           averageHeartRate: json["average_heartrate"].double!,
                           lapIndex: json["lap_index"].int!)
    }
}
