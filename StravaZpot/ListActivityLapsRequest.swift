//
//  ListActivityLapsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListActivityLapsRequest {
    private let client : HTTPClient
    private let id : Int
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<ActivityLap>>) -> ()) {
        client.get(url: "activities/\(id)/laps", parameters: [:]) { result in
            switch(result) {
            case let .success(json):
                if let lapsArray = json.activityLapArray {
                    callback(.success(lapsArray))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing activity lap array")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
