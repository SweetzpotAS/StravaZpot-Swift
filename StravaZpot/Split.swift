//
//  Split.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Split {
    public let distance : Distance
    public let elevationDifference : Distance
    public let elapsedTime : Time
    public let movingTime : Time
    public let split : Int
}

extension Split : Equatable {}

public func ==(lhs : Split, rhs : Split) -> Bool {
    return  lhs.distance            == rhs.distance &&
            lhs.elevationDifference == rhs.elevationDifference &&
            lhs.elapsedTime         == rhs.elapsedTime &&
            lhs.movingTime          == rhs.movingTime &&
            lhs.split               == rhs.split
}
