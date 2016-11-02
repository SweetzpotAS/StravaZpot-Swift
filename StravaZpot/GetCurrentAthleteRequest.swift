//
//  GetCurrentAthleteRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class GetCurrentAthleteRequest {
    private let client : HTTPClient
    
    init(client : HTTPClient) {
        self.client = client
    }
    
    public func execute(callback : @escaping (StravaResult<Athlete, StravaError>) -> ()) {
        client.get(url: "athlete", parameters: [:]) { result in
            switch(result) {
            case let .success(json) :
                if let athlete = json.athlete {
                    callback(.success(athlete))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing JSON")))
                }
            case let .error(content) :
                callback(.error(content))
            }
        }
    }
}
