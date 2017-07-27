//
//  UploadFileRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public class UploadFileRequest {
    private let client : HTTPClient
    private var parameters : [String : Data] = [:]
    private let file : URL
    private let filename : String
    
    init(client : HTTPClient, file : URL, filename : String, dataType : DataType, activityType : UploadActivityType?, name : String?, description : String?, isPrivate : Bool, hasTrainer : Bool, isCommute : Bool, externalID : String?) {
        self.client = client
        self.file = file
        self.filename = filename
        
        parameters["data_type"] = dataType.rawValue.data(using: .utf8, allowLossyConversion: false)
        activityType.flatMap{ activityType in parameters["activity_type"] = activityType.rawValue.data(using: .utf8, allowLossyConversion: false)}
        name.flatMap{ name in parameters["name"] = name.data(using: .utf8, allowLossyConversion: false)}
        description.flatMap{ description in parameters["description"] = description.data(using: .utf8, allowLossyConversion: false) }
        parameters["private"] = "\(isPrivate.intValue())".data(using: .utf8, allowLossyConversion: false)
        parameters["trainer"] = "\(hasTrainer.intValue())".data(using: .utf8, allowLossyConversion: false)
        parameters["commute"] = "\(isCommute.intValue())".data(using: .utf8, allowLossyConversion: false)
        externalID.flatMap{ externalID in parameters["external_id"] = externalID.data(using: .utf8, allowLossyConversion: false) }
    }
    
    public func execute(callback : @escaping (StravaResult<UploadStatus>) -> ()) {
        client.upload(file : self.file, withKey : "file", withName : filename, toUrl : "uploads", parameters : self.parameters, mimeType : "multipart/form-data"){ result in
            switch(result) {
            case let .success(json):
                if let parsed = json.uploadStatus {
                    callback(.success(parsed))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing \(json)")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
