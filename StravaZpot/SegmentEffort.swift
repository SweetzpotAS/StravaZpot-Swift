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
