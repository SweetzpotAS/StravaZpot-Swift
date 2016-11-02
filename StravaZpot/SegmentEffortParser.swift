//
//  SegmentEffortParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class SegmentEffortParser : Parser {
    public func from(json: JSON) -> SegmentEffort {
        return SegmentEffort(id: json["id"].int64!,
                             resourceState: json["resource_state"].resourceState!,
                             name: json["name"].string!,
                             activity: json["activity"].activity!,
                             athlete: AthleteParser().from(json: json["athlete"]),
                             elapsedTime: TimeParser().from(json: json["elapsed_time"]),
                             movingTime: TimeParser().from(json: json["moving_time"]),
                             startDate: DateParser().from(json: json["start_date"]),
                             startDateLocal: DateParser().from(json: json["start_date_local"]),
                             distance: DistanceParser().from(json: json["distance"]),
                             startIndex: json["start_index"].int!,
                             endIndex: json["end_index"].int!,
                             averageCadence: json["average_cadence"].double!,
                             averageWatts: json["average_watts"].double!,
                             hasDeviceWatts: json["device_watts"].bool!,
                             averageHeartRate: json["average_heartrate"].double!,
                             maxHeartRate: json["max_heartrate"].double!,
                             segment: SegmentParser().from(json: json["segment"]),
                             komRank: json["kom_rank"].int,
                             prRank: json["pr_rank"].int,
                             isHidden: json["hidden"].bool)
    }
}
