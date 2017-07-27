//
//  PrimaryPhoto.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct PrimaryPhoto {
    public let id : Int?
    public let uniqueID : String?
    public let source : PhotoSource
    public let urls : [String : String]
}

extension PrimaryPhoto : Equatable {}

public func ==(lhs : PrimaryPhoto, rhs : PrimaryPhoto) -> Bool {
    return  lhs.id       == rhs.id &&
            lhs.uniqueID == rhs.uniqueID &&
            lhs.source   == rhs.source &&
            lhs.urls     == rhs.urls
}
