//
//  LeaderboardEntryParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class LeaderboardEntryParser : Parser {
    public func from(json: JSON) -> LeaderboardEntry {
        return LeaderboardEntry(athleteID: json["athlete_id"].int!,
                                athleteName: json["athlete_name"].string!,
                                athleteGender: GenderParser().from(json: json["athlete_gender"]),
                                averageHeartRate: json["average_hr"].double!,
                                averageWatts: json["average_watts"].double!,
                                distance: DistanceParser().from(json: json["distance"]),
                                elapsedTime: TimeParser().from(json: json["elapsed_time"]),
                                movingTime: TimeParser().from(json: json["moving_time"]),
                                startDate: DateParser().from(json: json["start_date"]),
                                stardDateLocal: DateParser().from(json: json["start_date_local"]),
                                activityID: json["activity_id"].int!,
                                effortID: json["effort_id"].int!,
                                rank: json["rank"].int!,
                                athleteProfile: json["athlete_profile"].string!)
    }
}
