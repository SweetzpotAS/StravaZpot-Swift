//
//  PhotoParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PhotoParser : Parser {
    public func from(json: JSON) -> Photo {
        return Photo(uniqueID: json["unique_id"].string,
                     id: json["id"].int,
                     activityID: json["activity_id"].int!,
                     resourceState: json["resource_state"].resourceState!,
                     urls: json["urls"].imageURLs!,
                     caption: json["caption"].string!,
                     source: json["source"].photoSource,
                     uploadedAt: json["uploaded_at"].date!,
                     createdAt: json["created_at"].date!,
                     location: json["location"].coordinates,
                     ref: json["ref"].string,
                     uid: json["uid"].string,
                     type: json["type"].string)
    }
}
