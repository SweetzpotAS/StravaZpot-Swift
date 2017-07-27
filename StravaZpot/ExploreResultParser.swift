//
//  ExploreResultParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 27/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ExploreResultParser : Parser {
    public func from(json: JSON) -> ExploreResult {
        return ExploreResult(segments: json["segments"].segmentArray!)
    }
}
