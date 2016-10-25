//
//  Segment.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Segment {
    public let id : Int
    public let resourceState : ResourceState
    public let name : String
    public let activityType : ActivityType
    public let distance : Distance
    public let averageGrade : Percentage
    public let maximumGrade : Percentage
    public let elevationHight : Distance
    public let elevationLow : Distance
    public let startCoordinates : Coordinates
    public let endCoordinates : Coordinates
    public let climbCategory : Int
    public let city : String
    public let state : String
    public let country : String
    public let isPrivate : Bool
    public let isStarred : Bool
    public let isHazardous : Bool
    public let createdAt : Date?
    public let updatedAt : Date?
    public let totalElevationGain : Distance?
    public let map : Map?
    public let effortCount : Int?
    public let athleteCount : Int?
    public let starCount : Int?
}
