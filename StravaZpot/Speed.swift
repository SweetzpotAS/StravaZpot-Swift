//
//  Speed.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Speed {
    public let metersPerSecond : Double
}

extension Speed : Equatable {}

public func ==(lhs : Speed, rhs : Speed) -> Bool {
    return lhs.metersPerSecond == rhs.metersPerSecond
}
