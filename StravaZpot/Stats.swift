//
//  Stats.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Stats {
    public let biggestRideDistance : Distance
    public let biggestClimbElevationGain : Distance
    public let recentRideTotals : Totals
    public let recentRunTotals : Totals
    public let recentSwimTotals : Totals
    public let yearToDateRideTotals : Totals
    public let yearToDateRunTotals : Totals
    public let yearToDateSwimTotals : Totals
    public let allRideTotals : Totals
    public let allRunTotals : Totals
    public let allSwimTotals : Totals
}
