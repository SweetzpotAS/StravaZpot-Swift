//
//  ListActivitiesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListActivitiesRequest : ActivityArrayRequest, PaginatedRequest {
    private let before : Int?
    private let after : Int?
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, before : Int?, after : Int?) {
        self.before = before
        self.after = after
        super.init(client: client)
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Activity>>) -> ()) {
        let parameters = ["before" : before,
                          "after" : after] as [String : Any]
        request(url: "activities", parameters: parameters + pageParameters(), callback: callback)
    }
}
