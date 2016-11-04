//
//  ListActivityCommentsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListActivityCommentsRequest : PaginatedRequest {
    private let client : HTTPClient
    private let id : Int
    internal var page : Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Comment>>) -> ()) {
        client.get(url: "activities/\(id)/comments", parameters: pageParameters()){ result in
            switch(result) {
            case let .success(json):
                if let commentArray = json.commentArray {
                    callback(.success(commentArray))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing comment array")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
