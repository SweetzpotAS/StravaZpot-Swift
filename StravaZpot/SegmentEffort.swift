//
//  SegmentEffort.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct SegmentEffort {
    public let id : Int64
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
    public let averageCadence : Double
    public let averageWatts : Double
    public let hasDeviceWatts : Bool
    public let averageHeartRate : Double
    public let maxHeartRate : Double
    public let segment : Segment
    public let komRank : Int?
    public let prRank : Int?
    public let isHidden : Bool
}

extension SegmentEffort : Equatable {}

public func ==(lhs : SegmentEffort, rhs : SegmentEffort) -> Bool {
    return  lhs.id               == rhs.id &&
            lhs.resourceState    == rhs.resourceState &&
            lhs.name             == rhs.name &&
            lhs.activity         == rhs.activity &&
            lhs.athlete          == rhs.athlete &&
            lhs.elapsedTime      == rhs.elapsedTime &&
            lhs.movingTime       == rhs.movingTime &&
            lhs.startDate        == rhs.startDate &&
            lhs.startDateLocal   == rhs.startDateLocal &&
            lhs.distance         == rhs.distance &&
            lhs.startIndex       == rhs.startIndex &&
            lhs.endIndex         == rhs.endIndex &&
            lhs.averageCadence   == rhs.averageCadence &&
            lhs.averageWatts     == rhs.averageWatts &&
            lhs.hasDeviceWatts   == rhs.hasDeviceWatts &&
            lhs.averageHeartRate == rhs.averageHeartRate &&
            lhs.maxHeartRate     == rhs.maxHeartRate &&
            lhs.segment          == rhs.segment &&
            lhs.komRank          == rhs.komRank &&
            lhs.prRank           == rhs.prRank &&
            lhs.isHidden         == rhs.isHidden
}
