//
//  ListActivitiesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListActivitiesRequest : GetRequest<EquatableArray<Activity>>, PaginatedRequest {
    private var parameters : [String : Any] = [:]
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, before : Int?, after : Int?) {
        parameters["before"] = before
        parameters["after"] = after
        super.init(client: client, url: "activities", parse: { $0.activityArray })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters + pageParameters()
    }
}
