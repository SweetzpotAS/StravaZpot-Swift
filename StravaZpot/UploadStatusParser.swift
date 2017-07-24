//
//  UploadStatusParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class UploadStatusParser : Parser {
    public func from(json: JSON) -> UploadStatus {
        return UploadStatus(id: json["id"].int!,
            externalID: json["external_id"].string,
            error: json["error"].string,
            status: json["status"].string,
            activityID: json["activity_id"].int)
    }
}
