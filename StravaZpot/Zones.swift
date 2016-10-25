//
//  Zones.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Zones {
    public let heartRate : HeartRate
    public let power : Power
}

extension Zones : Equatable {}

public func ==(lhs : Zones, rhs : Zones) -> Bool {
    return  lhs.heartRate == rhs.heartRate &&
            lhs.power == rhs.power
}
