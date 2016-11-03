//
//  StravaResult.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public enum StravaResult<T : Equatable> {
    case success(T)
    case error(StravaError)
}

extension StravaResult : Equatable {}

public func ==<T>(lhs : StravaResult<T>, rhs : StravaResult<T>) -> Bool where T : Equatable {
    switch(lhs, rhs) {
    case let (.success(left), .success(right)):
        return left == right
    case let (.error(left), .error(right)):
        return left == right
    default:
        return false
    }
}
