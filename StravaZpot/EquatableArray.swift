//
//  EquatableArray.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class EquatableArray<T : Equatable> {
    public let array : [T]
    
    public init(array : [T]) {
        self.array = array
    }
}

extension EquatableArray : Equatable {}

public func ==<T>(lhs : EquatableArray<T>, rhs : EquatableArray<T>) -> Bool where T : Equatable {
    return lhs.array.count == rhs.array.count &&
        zip(lhs.array, rhs.array).reduce(true, { partial, pair in partial && pair.0 == pair.1})
}
