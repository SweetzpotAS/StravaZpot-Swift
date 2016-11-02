//
//  EventParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class EventParser : Parser {
    public func from(json: JSON) -> Event {
        return Event(id: json["id"].int!,
                     resourceState: json["resource_state"].resourceState!,
                     title: json["title"].string!,
                     description: json["description"].string!,
                     clubID: json["club_id"].int!,
                     organizingAthlete: json["organizing_athlete"].athlete!,
                     activityType: ActivityTypeParser().from(json: json["activity_type"]),
                     createdAt: json["created_at"].date!,
                     routeID: json["route_id"].int!,
                     isWomanOnly: json["women_only"].bool!,
                     isPrivate: json["private"].bool!,
                     skillLevel: SkillLevelParser().from(json: json["skill_levels"]),
                     terrain: TerrainParser().from(json: json["terrain"]),
                     upcomingOccurrences: getDates(json: json["upcoming_occurrences"]),
                     address: json["address"].string!)
    }
    
    private func getDates(json : JSON) -> EquatableArray<Date> {
        return EquatableArray<Date>(array: json.map { $1.date! })
    }
}
