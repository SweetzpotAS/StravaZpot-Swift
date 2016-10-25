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
