//
//  GetAthleteZonesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class GetAthleteZonesRequest {
    private let client : HTTPClient
    
    init(client : HTTPClient) {
        self.client = client
    }
    
    public func execute(callback : @escaping (StravaResult<Zones>) -> ()) {
        client.get(url: "athlete/zones", parameters: [:]) { result in
            switch(result) {
            case let .success(json):
                if let zones = json.zones {
                    callback(.success(zones))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing zones")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
