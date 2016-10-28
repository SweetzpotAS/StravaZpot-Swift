//
//  Event.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Event {
    public let id : Int
    public let resourceState : ResourceState
    public let title : String
    public let description : String
    public let clubID : Int
    public let organizingAthlete : Athlete
    public let activityType : ActivityType
    public let createdAt : Date
    public let routeID : Int
    public let isWomanOnly : Bool
    public let isPrivate : Bool
    public let skillLevel : SkillLevel
    public let terrain : Terrain
    public let upcomingOccurrences : EquatableArray<Date>
    public let address : String
}

extension Event : Equatable {}

public func ==(lhs : Event, rhs : Event) -> Bool {
    return  lhs.id == rhs.id &&
            lhs.resourceState == rhs.resourceState &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.clubID == rhs.clubID &&
            lhs.organizingAthlete == rhs.organizingAthlete &&
            lhs.activityType == rhs.activityType &&
            lhs.createdAt == rhs.createdAt &&
            lhs.routeID == rhs.routeID &&
            lhs.isWomanOnly == rhs.isWomanOnly &&
            lhs.isPrivate == rhs.isPrivate &&
            lhs.skillLevel == rhs.skillLevel &&
            lhs.terrain == rhs.terrain &&
            lhs.upcomingOccurrences == rhs.upcomingOccurrences &&
            lhs.address == rhs.address
}
