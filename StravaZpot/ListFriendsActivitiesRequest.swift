//
//  ListFriendsActivitiesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListFriendsActivitiesRequest : GetRequest<EquatableArray<Activity>>, PaginatedRequest {
    private let parameters : [String : Any]
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, before : Int?) {
        if let before = before {
            parameters = ["before" : before]
        } else {
            parameters = [:]
        }
        super.init(client: client, url: "activities/following", parse: { $0.activityArray })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters + self.pageParameters()
    }
}
