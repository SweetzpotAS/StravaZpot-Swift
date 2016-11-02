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
                    resourceState: json["resource_state"].resourceState!,
                    primary: json["primary"].bool!,
                    name: json["name"].string!,
                    distance: json["distance"].distance!,
                    brandName: json["brand_name"].string,
                    modelName: json["model_name"].string,
                    frameType: json["frame_type"].exists() ? FrameTypeParser().from(json: json["frame_type"]) : nil,
                    description: json["description"].string)
    }
}
