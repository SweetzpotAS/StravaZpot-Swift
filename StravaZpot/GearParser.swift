//
//  GearParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class GearParser : Parser {
    public func from(json: JSON) -> Gear {
        return Gear(id: json["id"].string!,
                    resourceState: ResourceStateParser().from(json: json["resource_state"]),
                    primary: json["primary"].bool!,
                    name: json["name"].string!,
                    distance: DistanceParser().from(json: json["distance"]),
                    brandName: json["brand_name"].string,
                    modelName: json["model_name"].string,
                    frameType: FrameTypeParser().from(json: json["frame_type"]),
                    description: json["description"].string)
    }
}
