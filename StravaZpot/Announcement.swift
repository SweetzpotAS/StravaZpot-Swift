//
//  Announcement.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Announcement {
    public let id : Int
    public let resourceState : ResourceState
    public let clubID : Int
    public let athlete : Athlete
    public let createdAt : Date
    public let message : String
}

extension Announcement : Equatable {}

public func ==(lhs : Announcement, rhs : Announcement) -> Bool {
    return  lhs.id            == rhs.id &&
            lhs.resourceState == rhs.resourceState &&
            lhs.clubID        == rhs.clubID &&
            lhs.athlete       == rhs.athlete &&
            lhs.createdAt     == rhs.createdAt &&
            lhs.message       == rhs.message
}
