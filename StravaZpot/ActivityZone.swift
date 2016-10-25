//
//  ActivityZone.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct ActivityZone {
    public let resourceState : ResourceState
    public let distributionBuckets : EquatableArray<TimedInterval<Double>>
    public let type : String
    public let sensorBased : Bool
    public let score : Int?
    public let points : Int?
    public let customZones : Bool?
    public let max : Int?
}
