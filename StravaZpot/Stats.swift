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

extension Stats : Equatable {}

public func ==(lhs : Stats, rhs : Stats) -> Bool {
    return  lhs.biggestRideDistance       == rhs.biggestRideDistance &&
            lhs.biggestClimbElevationGain == rhs.biggestClimbElevationGain &&
            lhs.recentRideTotals          == rhs.recentRideTotals &&
            lhs.recentRunTotals           == rhs.recentRunTotals &&
            lhs.recentSwimTotals          == rhs.recentSwimTotals &&
            lhs.yearToDateRideTotals      == rhs.yearToDateRideTotals &&
            lhs.yearToDateRunTotals       == rhs.yearToDateRunTotals &&
            lhs.yearToDateSwimTotals      == rhs.yearToDateSwimTotals &&
            lhs.allRideTotals             == rhs.allRideTotals &&
            lhs.allRunTotals              == rhs.allRunTotals &&
            lhs.allSwimTotals             == rhs.allSwimTotals
}
