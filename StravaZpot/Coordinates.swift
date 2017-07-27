//
//  Coordinates.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Coordinates {
    public let latitude : Double
    public let longitude : Double
}

extension Coordinates : Equatable {}

public func ==(lhs : Coordinates, rhs : Coordinates) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}
