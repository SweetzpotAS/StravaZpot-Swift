//
//  PrimaryPhotoParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PrimaryPhotoParser : Parser {
    public func from(json: JSON) -> PrimaryPhoto {
        return PrimaryPhoto(id: json["id"].int,
                            uniqueID: json["unique_id"].string,
                            source: json["source"].photoSource!,
                            urls: json["urls"].imageURLs!)
    }
}
