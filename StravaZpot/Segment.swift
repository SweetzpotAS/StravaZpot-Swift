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
    public let elevationHigh : Distance
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

extension Segment : Equatable {}

public func ==(lhs : Segment, rhs : Segment) -> Bool {
    return  lhs.id                 == rhs.id &&
            lhs.resourceState      == rhs.resourceState &&
            lhs.name               == rhs.name &&
            lhs.activityType       == rhs.activityType &&
            lhs.distance           == rhs.distance &&
            lhs.averageGrade       == rhs.averageGrade &&
            lhs.maximumGrade       == rhs.maximumGrade &&
            lhs.elevationHigh      == rhs.elevationHigh &&
            lhs.elevationLow       == rhs.elevationLow &&
            lhs.startCoordinates   == rhs.startCoordinates &&
            lhs.endCoordinates     == rhs.endCoordinates &&
            lhs.climbCategory      == rhs.climbCategory &&
            lhs.city               == rhs.city &&
            lhs.state              == rhs.state &&
            lhs.country            == rhs.country &&
            lhs.isPrivate          == rhs.isPrivate &&
            lhs.isStarred          == rhs.isStarred &&
            lhs.isHazardous        == rhs.isHazardous &&
            lhs.createdAt          == rhs.createdAt &&
            lhs.updatedAt          == rhs.updatedAt &&
            lhs.totalElevationGain == rhs.totalElevationGain &&
            lhs.map                == rhs.map &&
            lhs.effortCount        == rhs.effortCount &&
            lhs.athleteCount       == rhs.athleteCount &&
            lhs.starCount          == rhs.starCount
}
