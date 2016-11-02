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
                     urls: getURLs(json: json["urls"]),
                     caption: json["caption"].string!,
                     source: json["source"].exists() ? PhotoSourceParser().from(json: json["source"]) : nil,
                     uploadedAt: DateParser().from(json: json["uploaded_at"]),
                     createdAt: DateParser().from(json: json["created_at"]),
                     location: json["location"].exists() ? CoordinatesParser().from(json: json["location"]) : nil,
                     ref: json["ref"].string,
                     uid: json["uid"].string,
                     type: json["type"].string)
    }
    
    private func getURLs(json : JSON) -> [String : String] {
        let pairs = json.map { ($0, $1.string!) }
        var urls = [String : String]()
        pairs.forEach { urls[$0.0] = $0.1 }
        return urls
    }
}
