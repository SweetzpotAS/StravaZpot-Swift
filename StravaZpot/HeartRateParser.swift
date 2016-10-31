//
//  HeartRateParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class HeartRateParser : Parser {
    public func from(json: JSON) -> HeartRate {
        return HeartRate(customZones: json["custom_zones"].bool!,
                         zones: getZones(json: json["zones"]))
    }
    
    private func getZones(json: JSON) -> EquatableArray<Interval<Double>> {
        let intervalParser = IntervalDoubleParser()
        return EquatableArray(array: json.map{ intervalParser.from(json: $1) })
    }
}
