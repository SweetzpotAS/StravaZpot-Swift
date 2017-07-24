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
        return UploadStatus(id: json.int!,
            externalID: json.string,
            error: json.string,
            status: json.string,
            activityID: json.int)
    }
}
