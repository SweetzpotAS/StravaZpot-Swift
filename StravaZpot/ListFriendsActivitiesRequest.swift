//
//  ListFriendsActivitiesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListFriendsActivitiesRequest : ActivityArrayRequest, PaginatedRequest {
    private let before : Int?
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, before : Int?) {
        self.before = before
        super.init(client: client)
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Activity>>) -> ()) {
        let parameters = ["before" : before] as [String : Any]
        request(url: "activities/following", parameters: parameters + pageParameters(), callback: callback)
    }
}
