//
//  CheckUploadStatusRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public class CheckUploadStatusRequest : GetRequest<UploadStatus> {
    init(client : HTTPClient, id : Int) {
        super.init(client : client, url: "uploads/\(id)", parse : { $0.uploadStatus })
    }
}
