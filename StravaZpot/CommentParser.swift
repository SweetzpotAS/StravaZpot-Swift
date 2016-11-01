//
//  CommentParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CommentParser : Parser {
    public func from(json: JSON) -> Comment {
        return Comment(id: json["id"].int!,
                       resourceState: ResourceStateParser().from(json: json["resource_state"]),
                       activityID: json["activity_id"].int!,
                       text: json["text"].string!,
                       athlete: AthleteParser().from(json: json["athlete"]),
                       createdAt: DateParser().from(json: json["created_at"]))
    }
}
