//
//  Athlete.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Athlete {
    public let id : Int
    public let resourceState : ResourceState
    public let firstName : String?
    public let lastName : String?
    public let profileMedium : String?
    public let profile : String?
    public let city : String?
    public let state : String?
    public let country : String?
    public let sex : Gender?
    public let friend : FriendStatus?
    public let follower : FriendStatus?
    public let isPremium : Bool?
    public let createdAt : Date?
    public let updatedAt : Date?
    public let followerCount : Int?
    public let friendCount : Int?
    public let mutualFriendCount : Int?
    public let athleteType : AthleteType?
    public let datePreference : String?
    public let measurementPreference : MeasurementPreference?
    public let email : String?
    public let ftp : Int?
    public let weight : Double?
    public let clubs : EquatableArray<Club>?
    public let bikes : EquatableArray<Gear>?
    public let shoes : EquatableArray<Gear>?
}

extension Athlete : Equatable {}

public func ==(lhs : Athlete, rhs : Athlete) -> Bool {
    return  lhs.id                    == rhs.id &&
            lhs.resourceState         == rhs.resourceState &&
            lhs.firstName             == rhs.firstName &&
            lhs.lastName              == rhs.lastName &&
            lhs.profileMedium         == rhs.profileMedium &&
            lhs.profile               == rhs.profile &&
            lhs.city                  == rhs.city &&
            lhs.state                 == rhs.state &&
            lhs.country               == rhs.country &&
            lhs.sex                   == rhs.sex &&
            lhs.friend                == rhs.friend &&
            lhs.follower              == rhs.follower &&
            lhs.isPremium             == rhs.isPremium &&
            lhs.followerCount         == rhs.followerCount &&
            lhs.friendCount           == rhs.friendCount &&
            lhs.mutualFriendCount     == rhs.mutualFriendCount &&
            lhs.athleteType           == rhs.athleteType &&
            lhs.datePreference        == rhs.datePreference &&
            lhs.measurementPreference == rhs.measurementPreference &&
            lhs.email                 == rhs.email &&
            lhs.ftp                   == rhs.ftp &&
            lhs.weight                == rhs.weight &&
            lhs.clubs                 == rhs.clubs &&
            lhs.bikes                 == rhs.bikes &&
            lhs.shoes                 == rhs.shoes
}
