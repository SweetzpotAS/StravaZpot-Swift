//
//  UploadAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public class UploadAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func upload(file : URL,
                       withFilename filename : String,
                       withDataType dataType : DataType,
                       withActivityType activityType : UploadActivityType? = nil,
                       withName name : String? = nil,
                       withDescription description : String? = nil,
                       isPrivate : Bool = false,
                       hasTrainer : Bool = false,
                       isCommute : Bool = false,
                       withExternalID externalID : String? = nil) -> UploadFileRequest {
        return UploadFileRequest(client: self.client, file: file, filename: filename, dataType: dataType, activityType: activityType, name: name, description: description, isPrivate: isPrivate, hasTrainer: hasTrainer, isCommute: isCommute, externalID: externalID)
    }
    
    public func checkUploadStatus(withId id : Int) -> CheckUploadStatusRequest {
        return CheckUploadStatusRequest(client: client, id: id)
    }
}
