//
//  UpdateActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class UpdateActivityRequest : PutRequest<Activity> {
    private var parameters : [String : Any] = [:]
    
    init(client : HTTPClient, id : Int, name : String?, type : ActivityType?, isPrivate : Bool?, hasTrainer : Bool?, commute : Bool?, gearID : String?, description : String?) {
        parameters["name"] = name
        parameters["type"] = type?.rawValue
        parameters["private"] = isPrivate
        parameters["trainer"] = hasTrainer
        parameters["commute"] = commute
        parameters["gear_id"] = gearID
        parameters["description"] = description
        
        super.init(client: client, url: "activities/\(id)", parse: { $0.activity })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters
    }
}
