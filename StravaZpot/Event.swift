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
