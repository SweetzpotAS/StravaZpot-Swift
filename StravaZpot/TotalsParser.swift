//
//  TotalsParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class TotalsParser : Parser {
    private let timeParser = TimeParser()
    private let distanceParser = DistanceParser()
    
    public func from(json: JSON) -> Totals {
        return Totals(count: json["count"].int!,
                      distance: distanceParser.from(json: json["distance"]),
                      movingTime: timeParser.from(json: json["moving_time"]),
                      elapsedTime: timeParser.from(json: json["elapsed_time"]),
                      elevationGain: distanceParser.from(json: json["elevation_gain"]),
                      achievementCount: json["achievement_count"].int!)
    }
}
