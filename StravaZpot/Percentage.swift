//
//  Percentage.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Percentage {
    public let percent : Double
}

extension Percentage : Equatable {}

public func ==(lhs : Percentage, rhs : Percentage) -> Bool {
    return lhs.percent == rhs.percent
}
