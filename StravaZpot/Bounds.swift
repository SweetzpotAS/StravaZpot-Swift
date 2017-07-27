//
//  Bounds.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Bounds {
    public let southWest : Coordinates
    public let northEast : Coordinates
}

extension Bounds : Equatable {}

public func ==(lhs : Bounds, rhs : Bounds) -> Bool {
    return  lhs.southWest == rhs.southWest &&
            lhs.northEast == rhs.northEast
}

extension Bounds : CustomStringConvertible {
    public var description : String {
        return "\(southWest.latitude),\(southWest.longitude),\(northEast.latitude),\(northEast.longitude)"
    }
}
