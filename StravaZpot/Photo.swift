//
//  Photo.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Photo {
    public let uniqueID : String?
    public let id : Int?
    public let activityID : Int
    public let resourceState : ResourceState
    public let urls : [String : String]
    public let caption : String
    public let source : PhotoSource
    public let uploadedAt : Date
    public let createdAt : Date
    public let location : Coordinates?
    public let ref : String?
    public let uid : String?
    public let type : String?
}

extension Photo : Equatable {}

public func ==(lhs : Photo, rhs : Photo) -> Bool {
    return  lhs.uniqueID      == rhs.uniqueID &&
            lhs.id            == rhs.id &&
            lhs.activityID    == rhs.activityID &&
            lhs.resourceState == rhs.resourceState &&
            lhs.urls          == rhs.urls &&
            lhs.caption       == rhs.caption &&
            lhs.source        == rhs.source &&
            lhs.uploadedAt    == rhs.uploadedAt &&
            lhs.createdAt     == rhs.createdAt &&
            lhs.location      == rhs.location &&
            lhs.ref           == rhs.ref &&
            lhs.uid           == rhs.uid &&
            lhs.type          == rhs.type
}
