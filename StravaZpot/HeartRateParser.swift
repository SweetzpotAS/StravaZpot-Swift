//
//  HeartRateParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class HeartRateParser : Parser {
    public func from(json: JSON) -> HeartRate {
        return HeartRate(customZones: json["custom_zones"].bool!,
                         zones: json["zones"].intervalArray!)
    }
    
}
