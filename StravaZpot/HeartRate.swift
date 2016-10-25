//
//  HeartRate.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct HeartRate {
    public let customZones : Bool
    public let zones : EquatableArray<Interval<Double>>
}
