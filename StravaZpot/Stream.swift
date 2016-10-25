//
//  Stream.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Stream {
    public let type : StreamType
    public let data : [Any]
    public let seriesType : SeriesType
    public let originalSize : Int
    public let resolution : Resolution
}

extension Stream : Equatable {}

public func ==(lhs : Stream, rhs : Stream) -> Bool {
    return  lhs.type         == rhs.type &&
            lhs.seriesType   == rhs.seriesType &&
            lhs.originalSize == rhs.originalSize &&
            lhs.resolution   == rhs.resolution
}
