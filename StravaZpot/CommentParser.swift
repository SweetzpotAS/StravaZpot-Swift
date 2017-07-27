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
                       resourceState: json["resource_state"].resourceState!,
                       activityID: json["activity_id"].int!,
                       text: json["text"].string!,
                       athlete: json["athlete"].athlete!,
                       createdAt: json["created_at"].date!)
    }
}
