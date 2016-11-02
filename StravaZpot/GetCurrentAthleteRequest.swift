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
                let athlete = AthleteParser().from(json: json)
                callback(.success(athlete))
            case let .error(content) :
                callback(.error(content))
            }
        }
    }
}
