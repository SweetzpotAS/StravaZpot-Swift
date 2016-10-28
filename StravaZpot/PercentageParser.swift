//
//  PercentageParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PercentageParser : Parser {
    public func from(json: JSON) -> Percentage {
        return Percentage(percent: json.double!)
    }
}
