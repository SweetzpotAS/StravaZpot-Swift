//
//  Map.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Map {
    public let id : Int
    public let resourceState : ResourceState
    public let summaryPolyline : String
}

extension Map : Equatable {}

public func ==(lhs : Map, rhs : Map) -> Bool {
    return  lhs.id              == rhs.id &&
            lhs.resourceState   == rhs.resourceState &&
            lhs.summaryPolyline == rhs.summaryPolyline
}
