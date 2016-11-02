//
//  AchievementParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class AchievementParser : Parser {
    public func from(json: JSON) -> Achievement {
        return Achievement(typeID: json["type_id"].achievementType!,
                           type: json["type"].string!,
                           rank: json["rank"].int!)
    }
}
