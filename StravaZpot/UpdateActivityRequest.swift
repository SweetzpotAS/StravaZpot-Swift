//
//  UpdateActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class UpdateActivityRequest : ActivityRequest {
    private let id : Int
    private let name : String?
    private let type : ActivityType?
    private let isPrivate : Bool?
    private let hasTrainer : Bool?
    private let commute : Bool?
    private let gearID : String?
    private let description : String?
    
    init(client : HTTPClient, id : Int, name : String?, type : ActivityType?, isPrivate : Bool?, hasTrainer : Bool?, commute : Bool?, gearID : String?, description : String?) {
        self.id = id
        self.name = name
        self.type = type
        self.isPrivate = isPrivate
        self.hasTrainer = hasTrainer
        self.commute = commute
        self.gearID = gearID
        self.description = description
        super.init(client: client)
    }
    
    public func execute(callback : @escaping (StravaResult<Activity>) -> ()) {
        let parameters = [ "name" : name,
                           "type" : type?.rawValue,
                           "private" : isPrivate,
                           "trainer" : hasTrainer,
                           "commute" : commute,
                           "gear_id" : gearID,
                           "description" : description] as [String : Any]
        putRequest(url: "activities/\(id)", parameters: parameters, callback: callback)
    }
}
