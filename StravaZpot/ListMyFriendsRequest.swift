//
//  ListMyFriendsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListMyFriendsRequest : PaginatedRequest {
    private let client : HTTPClient
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient) {
        self.client = client
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Athlete>, StravaError>) -> ()) {
        client.get(url: "athlete/friends", parameters: pageParameters()) { result in
            switch(result) {
            case let .success(json):
                if let friends = json.athleteArray {
                    callback(.success(friends))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing athlete array")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
