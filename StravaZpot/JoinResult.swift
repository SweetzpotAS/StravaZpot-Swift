//
//  JoinResult.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct JoinResult {
    public let success : Bool
    public let active : Bool
    public let membership : Membership
}

extension JoinResult : Equatable {}

public func ==(lhs : JoinResult, rhs : JoinResult) -> Bool {
    return  lhs.success    == rhs.success &&
            lhs.active     == rhs.active &&
            lhs.membership == rhs.membership
}
