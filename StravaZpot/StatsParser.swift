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
    public func from(json: JSON) -> Stats {
        return Stats(biggestRideDistance: json["biggest_ride_distance"].distance!,
                     biggestClimbElevationGain: json["biggest_climb_elevation_gain"].distance!,
                     recentRideTotals: json["recent_ride_totals"].totals!,
                     recentRunTotals: json["recent_run_totals"].totals!,
                     recentSwimTotals: json["recent_swim_totals"].totals!,
                     yearToDateRideTotals: json["ytd_ride_totals"].totals!,
                     yearToDateRunTotals: json["ytd_run_totals"].totals!,
                     yearToDateSwimTotals: json["ytd_swim_totals"].totals!,
                     allRideTotals: json["all_ride_totals"].totals!,
                     allRunTotals: json["all_run_totals"].totals!,
                     allSwimTotals: json["all_swim_totals"].totals!)
    }
}
