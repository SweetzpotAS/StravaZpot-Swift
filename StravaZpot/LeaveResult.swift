//
//  LeaveResult.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct LeaveResult {
    public let success : Bool
    public let active : Bool
}

extension LeaveResult : Equatable {}

public func ==(lhs : LeaveResult, rhs : LeaveResult) -> Bool {
    return lhs.success == rhs.success && lhs.active == rhs.active
}
