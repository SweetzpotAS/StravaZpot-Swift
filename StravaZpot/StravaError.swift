//
//  StravaError.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public enum StravaError : Error {
    case unauthorized(message : String)
    case apiError(message : String)
}

extension StravaError : Equatable {}

public func ==(lhs : StravaError, rhs : StravaError) -> Bool {
    switch (lhs, rhs) {
    case let (.unauthorized(message: left), .unauthorized(message: right)):
        return left == right
    case let (.apiError(message: left), .apiError(message: right)):
        return left == right
    default:
        return false
    }
}
