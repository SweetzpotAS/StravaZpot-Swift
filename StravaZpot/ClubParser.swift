//
//  ClubParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ClubParser : Parser {
    public func from(json: JSON) -> Club {
        return Club(id: json["id"].int!,
                    resourceState: json["resource_state"].resourceState!,
                    name: json["name"].string!,
                    profileMedium: json["profile_medium"].string!,
                    profile: json["profile"].string!,
                    coverPhoto: json["cover_photo"].string!,
                    coverPhotoSmall: json["cover_photo_small"].string!,
                    sportType: SportTypeParser().from(json: json["sport_type"]),
                    city: json["city"].string!,
                    state: json["state"].string!,
                    country: json["country"].string!,
                    isPrivate: json["private"].bool!,
                    memberCount: json["member_count"].int!,
                    isFeatured: json["featured"].bool!,
                    isVerified: json["verified"].bool,
                    url: json["url"].string!,
                    description: json["description"].string,
                    clubType: json["club_type"].exists() ? ClubTypeParser().from(json: json["club_type"]) : nil,
                    membership: json["membership"].exists() ? MembershipParser().from(json: json["membership"]) : nil,
                    isAdmin: json["admin"].bool,
                    isOwner: json["owner"].bool,
                    followingCount: json["following_count"].int)
    }
}
