//
//  RetrieveActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class RetrieveActivityRequest : GetRequest<Activity> {
    private let parameters : [String : Any?]
    
    init(client : HTTPClient, id : Int, includeAllEfforts : Bool?) {
        parameters = ["include_all_efforts" : includeAllEfforts]
        super.init(client: client, url: "activities/\(id)", parse: { $0.activity })
    }
    
    override func getParameters() -> [String : Any?] {
        return parameters
    }
}
