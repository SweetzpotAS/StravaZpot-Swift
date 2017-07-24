//
//  DictionaryExtension.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

extension Dictionary {
    func flatten() -> Dictionary<Key, Value> {
        var dict = [Key : Value]()
        self.forEach { key, value in
            if let newValue = value as? OptionalType, !newValue.isNil {
                dict[key] = value
            } else if (value is OptionalType) == false {
                dict[key] = value
            }
        }
        return dict
    }
}

func +<T>(_ lhs : [T : Any?], _ rhs : [T : Any?]) -> [T : Any?] {
    var result = [T : Any?]()
    lhs.forEach{
        if $0.value != nil {
            result[$0.key] = $0.value
        }
    }
    rhs.forEach{
        if $0.value != nil {
            result[$0.key] = $0.value
        }
    }
    return result.flatten()
}
