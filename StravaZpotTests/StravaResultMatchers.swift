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

public func beSuccessful<T>() -> MatcherFunc<StravaResult<T, StravaError>> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "be successful>"
        if let actualValue = try actualExpression.evaluate() {
            switch(actualValue) {
            case .success(_) :
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
}
