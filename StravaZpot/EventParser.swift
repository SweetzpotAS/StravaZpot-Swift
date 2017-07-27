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
                     activityType: json["activity_type"].activityType!,
                     createdAt: json["created_at"].date!,
                     routeID: json["route_id"].int!,
                     isWomanOnly: json["women_only"].bool!,
                     isPrivate: json["private"].bool!,
                     skillLevel: json["skill_levels"].skillLevel!,
                     terrain: json["terrain"].terrain!,
                     upcomingOccurrences: json["upcoming_occurrences"].dateArray!,
                     address: json["address"].string!)
    }
}
