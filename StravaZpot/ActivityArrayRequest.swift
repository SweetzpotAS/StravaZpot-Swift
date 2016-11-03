//
//  ActivityArrayRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ActivityArrayRequest {
    private let client : HTTPClient
    
    init(client : HTTPClient) {
        self.client = client
    }
    
    func request(url : String, parameters : [String : Any], callback : @escaping (StravaResult<EquatableArray<Activity>>) -> ()) {
        client.get(url: url, parameters: parameters.flatten()){ result in
            switch(result) {
            case let .success(json):
                if let activityArray = json.activityArray {
                    callback(.success(activityArray))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing activity array")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
