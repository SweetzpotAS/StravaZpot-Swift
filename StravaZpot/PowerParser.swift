//
//  PowerParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PowerParser : Parser {
    public func from(json: JSON) -> Power {
        return Power(zones: getArray(json: json["zones"]))
    }
    
    private func getArray(json: JSON) -> EquatableArray<Interval<Double>> {
        let intervalParser = IntervalDoubleParser()
        return EquatableArray(array: json.map{ intervalParser.from(json: $1) })
    }
}
