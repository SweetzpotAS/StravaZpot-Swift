//
//  AthleteParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class AthleteParser : Parser {
    public func from(json: JSON) -> Athlete {
        return Athlete(id: json["id"].int!,
                       resourceState: json["resource_state"].exists() ? ResourceStateParser().from(json: json["resource_state"]) : ResourceState.meta,
                       firstName: json["firstname"].string,
                       lastName: json["lastname"].string,
                       profileMedium: json["profile_medium"].string,
                       profile: json["profile"].string,
                       city: json["city"].string,
                       state: json["state"].string,
                       country: json["country"].string,
                       sex: json["sex"].exists() ? GenderParser().from(json: json["sex"]) : nil,
                       friend: json["friend"].exists() ? FriendStatusParser().from(json: json["friend"]) : nil,
                       follower: json["follower"].exists() ? FriendStatusParser().from(json: json["follower"]) : nil,
                       isPremium: json["premium"].bool,
                       createdAt: json["created_at"].exists() ? DateParser().from(json: json["created_at"]) : nil,
                       updatedAt: json["updated_at"].exists() ? DateParser().from(json: json["updated_at"]) : nil,
                       followerCount: json["follower_count"].int,
                       friendCount: json["friend_count"].int,
                       mutualFriendCount: json["mutual_friend_count"].int,
                       athleteType: json["athlete_type"].exists() ? AthleteTypeParser().from(json: json["athlete_type"]) : nil,
                       datePreference: json["date_preference"].string,
                       measurementPreference: json["measurement_preference"].exists() ? MeasurementPreferenceParser().from(json: json["measurement_preference"]) : nil,
                       email: json["email"].string,
                       ftp: json["ftp"].int,
                       weight: json["weight"].double,
                       clubs: getClubs(json: json["clubs"]),
                       bikes: getGear(json: json["bikes"]),
                       shoes: getGear(json: json["shoes"]))
    }
    
    private func getClubs(json : JSON) -> EquatableArray<Club>? {
        if json.exists() {
            let clubParser = ClubParser()
            return EquatableArray<Club>(array: json.map { clubParser.from(json: $1) })
        } else {
            return nil
        }
    }
    
    private func getGear(json : JSON) -> EquatableArray<Gear>? {
        if json.exists() {
            let gearParser = GearParser()
            return EquatableArray<Gear>(array: json.map { gearParser.from(json: $1) })
        } else {
            return nil
        }
    }
}
