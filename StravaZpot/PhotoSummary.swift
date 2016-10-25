//
//  PhotoSummary.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct PhotoSummary {
    public let count : Int
    public let primary : PrimaryPhoto
}

extension PhotoSummary : Equatable {}

public func ==(lhs : PhotoSummary, rhs : PhotoSummary) -> Bool {
    return  lhs.count   == rhs.count &&
            lhs.primary == rhs.primary
}
