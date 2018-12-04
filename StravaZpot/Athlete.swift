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
    
    public init(id: Int, resourceState: ResourceState, firstName: String?, lastName: String?, profileMedium: String?, profile: String?, city: String?, state: String?, country: String?, sex: Gender?, friend: FriendStatus?, follower: FriendStatus?, isPremium: Bool?, createdAt: Date?, updatedAt: Date?, followerCount: Int?, friendCount: Int?, mutualFriendCount: Int?, athleteType: AthleteType?, datePreference: String?, measurementPreference: MeasurementPreference?, email: String?, ftp: Int?, weight: Double?, clubs: EquatableArray<Club>?, bikes: EquatableArray<Gear>?, shoes: EquatableArray<Gear>?) {
        
        self.id = id
        self.resourceState = resourceState
        self.firstName = firstName
        self.lastName = lastName
        self.profileMedium = profileMedium
        self.profile = profile
        self.city = city
        self.state = state
        self.country = country
        self.sex = sex
        self.friend = friend
        self.follower = follower
        self.isPremium = isPremium
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.followerCount = followerCount
        self.friendCount = friendCount
        self.mutualFriendCount = mutualFriendCount
        self.athleteType = athleteType
        self.datePreference = datePreference
        self.measurementPreference = measurementPreference
        self.email = email
        self.ftp = ftp
        self.weight = weight
        self.clubs = clubs
        self.bikes = bikes
        self.shoes = shoes
    }
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
            lhs.createdAt             == rhs.createdAt &&
            lhs.updatedAt             == rhs.updatedAt &&
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
