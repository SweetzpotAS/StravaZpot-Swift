//
//  ListAthleteKOMSRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListAthleteKOMSRequest : PaginatedRequest {
    private let client : HTTPClient
    private let id : Int
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<SegmentEffort>, StravaError>) -> ()) {
        client.get(url: "athletes/\(id)/koms", parameters: pageParameters()) { result in
            switch(result) {
            case let .success(json):
                if let effortArray = json.segmentEffortArray {
                    callback(.success(effortArray))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing segment effort array")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
