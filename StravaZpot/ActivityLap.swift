//
//  ActivityLap.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct ActivityLap {
    public let id : Int
    public let resourceState : ResourceState
    public let name : String
    public let activity : Activity
    public let athlete : Athlete
    public let elapsedTime : Time
    public let movingTime : Time
    public let startDate : Date
    public let startDateLocal : Date
    public let distance : Distance
    public let startIndex : Int
    public let endIndex : Int
    public let totalElevationGain : Distance
    public let averageSpeed : Speed
    public let maxSpeed : Speed
    public let averageCadence : Double
    public let averageWatts : Double
    public let hasDeviceWatts : Bool
    public let hasHeartRate : Bool
    public let maxHeartRate : Double
    public let averageHeartRate : Double
    public let lapIndex : Int
}
