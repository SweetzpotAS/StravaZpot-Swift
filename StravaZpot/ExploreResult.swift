//
//  ExploreResult.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 27/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public struct ExploreResult {
    let segments : EquatableArray<Segment>?
}

extension ExploreResult : Equatable {}

public func ==(lhs : ExploreResult, rhs : ExploreResult) -> Bool {
    return lhs.segments == rhs.segments
}
