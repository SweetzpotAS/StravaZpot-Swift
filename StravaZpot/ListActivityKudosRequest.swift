//
//  ListActivityKudosRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListActivityKudosRequest : AthleteArrayRequest, PaginatedRequest {
    private let id : Int
    internal var page : Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        self.id = id
        super.init(client: client)
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Athlete>>) -> ()) {
        request(url: "activities/\(id)/kudos", parameters: pageParameters(), callback: callback)
    }
}
