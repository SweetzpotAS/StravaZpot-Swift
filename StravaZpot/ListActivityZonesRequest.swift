//
//  ListActivityZonesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListActivityZonesRequest {
    private let client : HTTPClient
    private let id : Int
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<ActivityZone>>) -> ()) {
        client.get(url: "activities/\(id)/zones", parameters: [:]) { result in
            switch(result) {
            case let .success(json):
                if let activityZoneArray = json.activityZoneArray {
                    callback(.success(activityZoneArray))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing activity zones array")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
