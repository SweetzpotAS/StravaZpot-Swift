//
//  GetTotalsAndStatsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class GetTotalsAndStatsRequest {
    private let client : HTTPClient
    private let id : Int
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<Stats, StravaError>) -> ()) {
        client.get(url: "athletes/\(id)/stats", parameters: [:]) { result in
            switch(result) {
            case let .success(json):
                if let stats = json.stats {
                    callback(.success(stats))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing stats")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
