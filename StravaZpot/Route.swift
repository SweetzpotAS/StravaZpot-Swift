//
//  Route.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Route {
    public let id : Int
    public let resourceState : ResourceState
    public let name : String
    public let description : String
    public let athlete : Athlete
    public let distance : Distance
    public let elevationGain : Distance
    public let map : Map
    public let type : RouteType
    public let subtype : RouteSubtype
    public let isPrivate : Bool
    public let isStarred : Bool
    public let timestamp : Int
    public let segments : EquatableArray<Segment>?
}

extension Route : Equatable {}

public func ==(lhs : Route, rhs : Route) -> Bool {
    return  lhs.id            == rhs.id &&
            lhs.resourceState == rhs.resourceState &&
            lhs.name          == rhs.name &&
            lhs.description   == rhs.description &&
            lhs.athlete       == rhs.athlete &&
            lhs.distance      == rhs.distance &&
            lhs.elevationGain == rhs.elevationGain &&
            lhs.map           == rhs.map &&
            lhs.type          == rhs.type &&
            lhs.subtype       == rhs.subtype &&
            lhs.isPrivate     == rhs.isPrivate &&
            lhs.isStarred     == rhs.isStarred &&
            lhs.timestamp     == rhs.timestamp &&
            lhs.segments      == rhs.segments
}
