//
//  SkillLevelParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class SkillLevelParser : Parser {
    public func from(json: JSON) -> SkillLevel {
        return SkillLevel(rawValue: json.int!)!
    }
}
