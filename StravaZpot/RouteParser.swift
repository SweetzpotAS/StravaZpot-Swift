//
//  RouteParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class RouteParser : Parser {
    public func from(json: JSON) -> Route {
        return Route(id: json["id"].int!,
                     resourceState: json["resource_state"].resourceState!,
                     name: json["name"].string!,
                     description: json["description"].string!,
                     athlete: json["athlete"].athlete!,
                     distance: json["distance"].distance!,
                     elevationGain: json["elevation_gain"].distance!,
                     map: json["map"].map!,
                     type: json["type"].routeType!,
                     subtype: json["sub_type"].routeSubtype,
                     isPrivate: json["private"].bool!,
                     isStarred: json["starred"].bool!,
                     timestamp: json["timestamp"].int!,
                     segments: json["segments"].segmentArray)
    }
}
