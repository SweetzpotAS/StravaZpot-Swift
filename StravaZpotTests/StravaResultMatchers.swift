//
//  StravaResultMatchers.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import Nimble
@testable import StravaZpot

public func beSuccessful<T>() -> Predicate<StravaResult<T>> {
    return Predicate.define("be successful") { actualExpression, msg in
        if let actualValue = try actualExpression.evaluate() {
            switch(actualValue) {
            case .success(_) :
                return PredicateResult(bool: true, message: msg)
            default:
                return PredicateResult(bool: false, message: msg)
            }
        } else {
            return PredicateResult(bool: false, message: msg)
        }
    }
}
