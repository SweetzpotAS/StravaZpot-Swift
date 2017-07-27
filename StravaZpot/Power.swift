//
//  Power.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Power {
    public let zones : EquatableArray<Interval<Double>>
}

extension Power : Equatable {}

public func ==(lhs : Power, rhs : Power) -> Bool {
    return lhs.zones == rhs.zones
}
