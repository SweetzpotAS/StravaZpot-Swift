//
//  CreateActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class CreateActivityRequest : ActivityRequest {
    private let name : String
    private let type : ActivityType
    private let startDate : Date
    private let elapsedTime : Time
    private let description : String?
    private let distance : Distance?
    private let isPrivate : Bool?
    private let hasTrainer : Bool?
    private let commute : Bool?
    
    init(client: HTTPClient, name : String, type : ActivityType, startDate : Date, elapsedTime : Time, description : String?, distance : Distance?, isPrivate : Bool?, hasTrainer : Bool?, commute : Bool?) {
        self.name = name
        self.type = type
        self.startDate = startDate
        self.elapsedTime = elapsedTime
        self.description = description
        self.distance = distance
        self.isPrivate = isPrivate
        self.hasTrainer = hasTrainer
        self.commute = commute
        super.init(client: client)
    }
    
    public func execute(callback : @escaping (StravaResult<Activity>) -> ()) {
        let parameters = ["name" : name,
                          "type" : type.rawValue,
                          "start_date_local" : startDate.iso8601,
                          "elapsed_time" : elapsedTime.seconds,
                          "description" : description,
                          "distance" : distance?.meters,
                          "private" : isPrivate,
                          "trainer" : hasTrainer,
                          "commute" : commute ] as [String : Any]
        postRequest(url: "activities", parameters: parameters, callback: callback)
    }
}
