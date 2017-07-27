//
//  CreateActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class CreateActivityRequest : PostRequest<Activity> {
    private let parameters : [String : Any?]
    
    init(client: HTTPClient, name : String, type : ActivityType, startDate : Date, elapsedTime : Time, description : String?, distance : Distance?, isPrivate : Bool?, hasTrainer : Bool?, commute : Bool?) {
        parameters = ["name" : name,
                      "type" : type.rawValue,
                      "start_date_local" : startDate.iso8601,
                      "elapsed_time" : elapsedTime.seconds,
                      "description" : description,
                      "distance" : distance?.meters,
                      "private" : isPrivate,
                      "trainer" : hasTrainer,
                      "commute" : commute ] as [String : Any?]
        super.init(client: client, url: "activities", parse: { $0.activity })
    }
    
    override func getParameters() -> [String : Any?] {
        return parameters
    }
}
