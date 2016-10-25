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
    public let isVerified : Bool
    public let url : String
    public let description : String?
    public let clubType : ClubType?
    public let membership : Membership?
    public let isAdmin : Bool?
    public let isOwner : Bool?
    public let followingCount : Int?
}
