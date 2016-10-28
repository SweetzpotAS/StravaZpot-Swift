//
//  Comment.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Comment {
    public let id : Int
    public let resourceState : ResourceState
    public let activityID : Int
    public let text : String
    public let athlete : Athlete
    public let createdAt : Date
}
