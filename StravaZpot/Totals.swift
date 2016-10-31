//
//  Totals.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Totals {
    public let count : Int
    public let distance : Distance
    public let movingTime : Time
    public let elapsedTime : Time
    public let elevationGain : Distance
    public let achievementCount : Int?
}

extension Totals : Equatable {}

public func ==(lhs : Totals, rhs : Totals) -> Bool {
    return  lhs.count            == rhs.count &&
            lhs.distance         == rhs.distance &&
            lhs.movingTime       == rhs.movingTime &&
            lhs.elapsedTime      == rhs.elapsedTime &&
            lhs.elevationGain    == rhs.elevationGain &&
            lhs.achievementCount == rhs.achievementCount
}
