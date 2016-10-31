//
//  ZonesParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ZonesParser : Parser {
    public func from(json: JSON) -> Zones {
        return Zones(heartRate: HeartRateParser().from(json: json["heart_rate"]),
                     power: PowerParser().from(json: json["power"]))
    }
}
