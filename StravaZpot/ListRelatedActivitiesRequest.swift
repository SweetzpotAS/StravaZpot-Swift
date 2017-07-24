//
//  ListRelatedActivitiesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListRelatedActivitiesRequest : GetRequest<EquatableArray<Activity>>, PaginatedRequest {
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "activities/\(id)/related", parse: { $0.activityArray })
    }
    
    override func getParameters() -> [String : Any?] {
        return pageParameters()
    }
}
