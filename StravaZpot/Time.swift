//
//  Time.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Time {
    public let seconds : Int
    
    public init(seconds: Int) {
        self.seconds = seconds
    }
}

extension Time : Equatable {}

public func ==(lhs : Time, rhs : Time) -> Bool {
    return lhs.seconds == rhs.seconds
}
