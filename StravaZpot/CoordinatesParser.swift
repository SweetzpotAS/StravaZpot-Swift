//
//  CoordinatesParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CoordinatesParser : Parser {
    public func from(json: JSON) -> Coordinates {
        
        if json.arrayValue.count < 2 {
            return Coordinates(latitude: 0,longitude: 0)
        }
        
        return Coordinates(latitude: json.arrayValue[0].double!,
                           longitude: json.arrayValue[1].double!)
    }
}
