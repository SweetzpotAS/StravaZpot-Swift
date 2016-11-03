//
//  ListMyFriendsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListMyFriendsRequest : AthleteArrayRequest, PaginatedRequest {
    internal var page: Int?
    internal var perPage: Int?
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Athlete>>) -> ()) {
        request(url: "athlete/friends", parameters: pageParameters(), callback: callback)
    }
}
