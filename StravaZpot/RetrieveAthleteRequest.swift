//
//  RetrieveAthleteRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class RetrieveAthleteRequest {
    private let client : HTTPClient
    private let id : Int
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<Athlete, StravaError>) -> ()) {
        client.get(url: "athletes/\(self.id)", parameters: [:]) { result in
            switch(result) {
            case let .success(json):
                if let athlete = json.athlete {
                    callback(.success(athlete))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing athlete")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
