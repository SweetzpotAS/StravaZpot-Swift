//
//  StravaResult.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public enum StravaResult<T : Equatable, U : Equatable> where U : Error {
    case success(T)
    case error(U)
}

extension StravaResult : Equatable {}

public func ==<T, U>(lhs : StravaResult<T, U>, rhs : StravaResult<T, U>) -> Bool where T : Equatable, U : Equatable, U : Error{
    switch(lhs, rhs) {
    case let (.success(left), .success(right)):
        return left == right
    case let (.error(left), .error(right)):
        return left == right
    default:
        return false
    }
}
