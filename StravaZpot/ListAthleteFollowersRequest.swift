//
//  ListAthleteFollowersRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListAthleteFollowersRequest : AthleteArrayRequest, PaginatedRequest {
    private let id : Int
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        self.id = id
        super.init(client: client)
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Athlete>, StravaError>) -> ()) {
        request(url: "athletes/\(id)/followers", parameters: pageParameters(), callback: callback)
    }
}