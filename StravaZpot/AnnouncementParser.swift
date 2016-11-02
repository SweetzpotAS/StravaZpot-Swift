//
//  AnnouncementParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class AnnouncementParser : Parser {
    public func from(json: JSON) -> Announcement {
        return Announcement(id: json["id"].int!,
                            resourceState: json["resource_state"].resourceState!,
                            clubID: json["club_id"].int!,
                            athlete: AthleteParser().from(json: json["athlete"]),
                            createdAt: DateParser().from(json: json["created_at"]),
                            message: json["message"].string!)
    }
}
