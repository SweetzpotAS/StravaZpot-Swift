//
//  MapParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MapParser : Parser {
    public func from(json: JSON) -> Map {
        return Map(id: json["id"].string!,
                   resourceState: ResourceStateParser().from(json: json["resource_state"]),
                   summaryPolyline: json["summary_polyline"].string!)
    }
}
