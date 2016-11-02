//
//  SplitParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class SplitParser : Parser {
    private let distanceParser = DistanceParser()
    
    public func from(json: JSON) -> Split {
        return Split(distance: distanceParser.from(json: json["distance"]),
                     elevationDifference: distanceParser.from(json: json["elevation_difference"]),
                     elapsedTime: json["elapsed_time"].time!,
                     movingTime: json["moving_time"].time!,
                     split: json["split"].int!)
    }
}
