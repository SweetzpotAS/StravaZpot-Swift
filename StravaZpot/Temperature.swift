//
//  Temperature.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Temperature {
    public let celsiusDegrees : Double
}

extension Temperature : Equatable {}

public func ==(lhs : Temperature, rhs : Temperature) -> Bool {
    return lhs.celsiusDegrees == rhs.celsiusDegrees
}
