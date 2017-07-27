//
//  ActivityZoneParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ActivityZoneParser : Parser {
    public func from(json: JSON) -> ActivityZone {
        return ActivityZone(resourceState: json["resource_state"].resourceState!,
                            distributionBuckets: json["distribution_buckets"].timedIntervalArray!,
                            type: json["type"].string!,
                            sensorBased: json["sensor_based"].bool!,
                            score: json["score"].int,
                            points: json["points"].int,
                            customZones: json["custom_zones"].bool,
                            max: json["max"].int)
    }
}
