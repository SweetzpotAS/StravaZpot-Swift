//
//  LeaderboardEntry.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct LeaderboardEntry {
    public let athleteID : Int
    public let athleteName : String
    public let athleteGender : Gender?
    public let averageHeartRate : Double?
    public let averageWatts : Double?
    public let distance : Distance?
    public let elapsedTime : Time?
    public let movingTime : Time?
    public let startDate : Date?
    public let stardDateLocal : Date?
    public let activityID : Int?
    public let effortID : Int?
    public let rank : Int?
    public let athleteProfile : String?
}

extension LeaderboardEntry : Equatable {}

public func ==(lhs : LeaderboardEntry, rhs : LeaderboardEntry) -> Bool {
    return  lhs.athleteID        == rhs.athleteID &&
            lhs.athleteName      == rhs.athleteName &&
            lhs.athleteGender    == rhs.athleteGender &&
            lhs.averageHeartRate == rhs.averageHeartRate &&
            lhs.averageWatts     == rhs.averageWatts &&
            lhs.distance         == rhs.distance &&
            lhs.elapsedTime      == rhs.elapsedTime &&
            lhs.movingTime       == rhs.movingTime &&
            lhs.startDate        == rhs.startDate &&
            lhs.stardDateLocal   == rhs.stardDateLocal &&
            lhs.activityID       == rhs.activityID &&
            lhs.effortID         == rhs.effortID &&
            lhs.rank             == rhs.rank &&
            lhs.athleteProfile   == rhs.athleteProfile
}
