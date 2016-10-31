//
//  StatsParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class StatsParser : Parser {
    private let distanceParser = DistanceParser()
    private let totalsParser = TotalsParser()
    
    public func from(json: JSON) -> Stats {
        return Stats(biggestRideDistance: distanceParser.from(json: json["biggest_ride_distance"]),
                     biggestClimbElevationGain: distanceParser.from(json: json["biggest_climb_elevation_gain"]),
                     recentRideTotals: totalsParser.from(json: json["recent_ride_totals"]),
                     recentRunTotals: totalsParser.from(json: json["recent_run_totals"]),
                     recentSwimTotals: totalsParser.from(json: json["recent_swim_totals"]),
                     yearToDateRideTotals: totalsParser.from(json: json["ytd_ride_totals"]),
                     yearToDateRunTotals: totalsParser.from(json: json["ytd_run_totals"]),
                     yearToDateSwimTotals: totalsParser.from(json: json["ytd_swim_totals"]),
                     allRideTotals: totalsParser.from(json: json["all_ride_totals"]),
                     allRunTotals: totalsParser.from(json: json["all_run_totals"]),
                     allSwimTotals: totalsParser.from(json: json["all_swim_totals"]))
    }
}
