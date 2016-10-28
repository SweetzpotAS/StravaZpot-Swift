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
}
