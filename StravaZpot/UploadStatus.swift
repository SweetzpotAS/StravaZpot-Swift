//
//  UploadStatus.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public struct UploadStatus {
    public let id : Int
    let externalID : String?
    let error : String?
    let status : String?
    let activityID : Int?
}

extension UploadStatus : Equatable {}

public func ==(lhs : UploadStatus, rhs : UploadStatus) -> Bool {
    return  lhs.id         == rhs.id &&
            lhs.externalID == rhs.externalID &&
            lhs.error      == rhs.error &&
            lhs.status     == rhs.status &&
            lhs.activityID == rhs.activityID
}
