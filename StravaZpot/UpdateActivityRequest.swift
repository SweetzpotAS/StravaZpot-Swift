//
//  UpdateActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class UpdateActivityRequest : PutRequest<Activity> {
    private let parameters : [String : Any]
    
    init(client : HTTPClient, id : Int, name : String?, type : ActivityType?, isPrivate : Bool?, hasTrainer : Bool?, commute : Bool?, gearID : String?, description : String?) {
        parameters = [ "name" : name,
                       "type" : type?.rawValue,
                       "private" : isPrivate,
                       "trainer" : hasTrainer,
                       "commute" : commute,
                       "gear_id" : gearID,
                       "description" : description] as [String : Any]
        super.init(client: client, url: "activities/\(id)", parse: { $0.activity })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters
    }
}
