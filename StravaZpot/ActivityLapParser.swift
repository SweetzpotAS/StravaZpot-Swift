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
                           activity: json["activity"].activity!,
                           athlete: json["athlete"].athlete!,
                           elapsedTime: json["elapsed_time"].time!,
                           movingTime: json["moving_time"].time!,
                           startDate: json["start_date"].date!,
                           startDateLocal: json["start_date_local"].date!,
                           distance: json["distance"].distance!,
                           startIndex: json["start_index"].int!,
                           endIndex: json["end_index"].int!,
                           totalElevationGain: json["total_elevation_gain"].distance!,
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
