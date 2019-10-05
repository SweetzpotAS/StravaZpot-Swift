//
//  Distance.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Distance {
    public let meters : Double
    public init(meters: Double) {
        self.meters = meters
    }
}

extension Distance : Equatable {}

public func ==(lhs : Distance, rhs : Distance) -> Bool {
    return lhs.meters == rhs.meters
}
