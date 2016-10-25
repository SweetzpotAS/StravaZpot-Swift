//
//  Photo.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Photo {
    public let uniqueID : String?
    public let id : Int?
    public let activityID : Int
    public let resourceState : ResourceState
    public let urls : [String : String]
    public let caption : String
    public let source : PhotoSource
    public let uploadedAt : Date
    public let createdAt : Date
    public let location : Coordinates?
    public let ref : String?
    public let uid : String?
    public let type : String?
}
