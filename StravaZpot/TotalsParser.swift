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
    private let distanceParser = DistanceParser()
    
    public func from(json: JSON) -> Totals {
        return Totals(count: json["count"].int!,
                      distance: distanceParser.from(json: json["distance"]),
                      movingTime: json["moving_time"].time!,
                      elapsedTime: json["elapsed_time"].time!,
                      elevationGain: distanceParser.from(json: json["elevation_gain"]),
                      achievementCount: json["achievement_count"].int)
    }
}
