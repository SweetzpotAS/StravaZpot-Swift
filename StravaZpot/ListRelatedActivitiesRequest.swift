//
//  ListRelatedActivitiesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListRelatedActivitiesRequest : ActivityArrayRequest, PaginatedRequest {
    private let id : Int
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        self.id = id
        super.init(client: client)
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Activity>>) -> ()) {
        request(url: "activities/\(id)/related", parameters: pageParameters(), callback: callback)
    }
}
