//
//  StreamParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class StreamParser : Parser {
    public func from(json: JSON) -> Stream {
        return Stream(type: json["type"].streamType!,
                      data: json["data"].array!,
                      seriesType: json["series_type"].seriesType!,
                      originalSize: json["original_size"].int!,
                      resolution: ResolutionParser().from(json: json["resolution"]))
    }
}
