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

extension ActivityLap : Equatable {}

public func ==(lhs : ActivityLap, rhs : ActivityLap) -> Bool {
    return  lhs.id                 == rhs.id &&
            lhs.resourceState      == rhs.resourceState &&
            lhs.name               == rhs.name &&
            lhs.activity           == rhs.activity &&
            lhs.athlete            == rhs.athlete &&
            lhs.elapsedTime        == rhs.elapsedTime &&
            lhs.movingTime         == rhs.movingTime &&
            lhs.startDate          == rhs.startDate &&
            lhs.startDateLocal     == rhs.startDateLocal &&
            lhs.distance           == rhs.distance &&
            lhs.startIndex         == rhs.startIndex &&
            lhs.endIndex           == rhs.endIndex &&
            lhs.totalElevationGain == rhs.totalElevationGain &&
            lhs.averageSpeed       == rhs.averageSpeed &&
            lhs.maxSpeed           == rhs.maxSpeed &&
            lhs.averageCadence     == rhs.averageCadence &&
            lhs.averageWatts       == rhs.averageWatts &&
            lhs.hasDeviceWatts     == rhs.hasDeviceWatts &&
            lhs.hasHeartRate       == rhs.hasHeartRate &&
            lhs.maxHeartRate       == rhs.maxHeartRate &&
            lhs.averageHeartRate   == rhs.averageHeartRate &&
            lhs.lapIndex           == rhs.lapIndex
}
