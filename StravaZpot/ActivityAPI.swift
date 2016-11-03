//
//  ActivityAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ActivityAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func createActivity(withName name : String,
                               withType type : ActivityType,
                               withStartDate startDate : Date,
                               withElapsedTime elapsedTime : Time,
                               withDescription description : String? = nil,
                               withDistance distance : Distance? = nil,
                               isPrivate : Bool? = nil,
                               withTrainer hasTrainer : Bool? = nil,
                               withCommute commute : Bool? = nil) -> CreateActivityRequest{
        return CreateActivityRequest(client: client, name: name, type: type, startDate: startDate, elapsedTime: elapsedTime, description: description, distance: distance, isPrivate: isPrivate, hasTrainer: hasTrainer, commute: commute)
    }
}
