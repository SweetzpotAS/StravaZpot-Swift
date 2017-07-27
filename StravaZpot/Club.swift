//
//  Club.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Club {
    public let id : Int
    public let resourceState : ResourceState
    public let name : String
    public let profileMedium : String
    public let profile : String
    public let coverPhoto : String
    public let coverPhotoSmall : String
    public let sportType : SportType
    public let city : String
    public let state : String
    public let country : String
    public let isPrivate : Bool
    public let memberCount : Int
    public let isFeatured : Bool
    public let isVerified : Bool?
    public let url : String
    public let description : String?
    public let clubType : ClubType?
    public let membership : Membership?
    public let isAdmin : Bool?
    public let isOwner : Bool?
    public let followingCount : Int?
}

extension Club : Equatable {}

public func ==(lhs : Club, rhs : Club) -> Bool {
    return  lhs.id              == rhs.id &&
            lhs.resourceState   == rhs.resourceState &&
            lhs.name            == rhs.name &&
            lhs.profileMedium   == rhs.profileMedium &&
            lhs.profile         == rhs.profile &&
            lhs.coverPhoto      == rhs.coverPhoto &&
            lhs.coverPhotoSmall == rhs.coverPhotoSmall &&
            lhs.sportType       == rhs.sportType &&
            lhs.city            == rhs.city &&
            lhs.state           == rhs.state &&
            lhs.country         == rhs.country &&
            lhs.isPrivate       == rhs.isPrivate &&
            lhs.memberCount     == rhs.memberCount &&
            lhs.isFeatured      == rhs.isFeatured &&
            lhs.isVerified      == rhs.isVerified &&
            lhs.url             == rhs.url &&
            lhs.description     == rhs.description &&
            lhs.clubType        == rhs.clubType &&
            lhs.membership      == rhs.membership &&
            lhs.isAdmin         == rhs.isAdmin &&
            lhs.isOwner         == rhs.isOwner &&
            lhs.followingCount  == rhs.followingCount
}
