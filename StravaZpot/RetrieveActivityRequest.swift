//
//  RetrieveActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class RetrieveActivityRequest : ActivityRequest {
    private let id : Int
    private let includeAllEfforts : Bool?
    
    init(client : HTTPClient, id : Int, includeAllEfforts : Bool?) {
        self.id = id
        self.includeAllEfforts = includeAllEfforts
        super.init(client: client)
    }
    
    public func execute(callback : @escaping (StravaResult<Activity, StravaError>) -> ()) {
        let parameters = ["include_all_efforts" : includeAllEfforts] as [String : Any]
        getRequest(url: "activities/\(id)", parameters: parameters, callback: callback)
    }
}
