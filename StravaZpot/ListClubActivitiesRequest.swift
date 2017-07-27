//
//  ListClubActivitiesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListClubActivitiesRequest : GetRequest<EquatableArray<Activity>>, PaginatedRequest {
    private let parameters : [String : Any?]
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int, before : Int?) {
        parameters = [ "before" : before ]
        super.init(client: client, url: "clubs/\(id)/activities", parse: { $0.activityArray })
    }
    
    override func getParameters() -> [String : Any?] {
        return parameters + pageParameters()
    }
}
