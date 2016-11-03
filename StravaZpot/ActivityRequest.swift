//
//  ActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ActivityRequest {
    private let client : HTTPClient
    
    init(client : HTTPClient) {
        self.client = client
    }
    
    func getRequest(url : String, parameters : [String : Any], callback : @escaping (StravaResult<Activity, StravaError>) -> ()) {
        client.get(url: url, parameters: parameters.flatten(), callback: parseActivity(callback: callback))
    }
    
    func postRequest(url : String, parameters : [String : Any], callback : @escaping (StravaResult<Activity, StravaError>) -> ()) {
        client.post(url: url, parameters: parameters.flatten(), callback: parseActivity(callback: callback))
    }
    
    func putRequest(url : String, parameters : [String : Any], callback : @escaping (StravaResult<Activity, StravaError>) -> ()) {
        client.put(url: url, parameters: parameters.flatten(), callback: parseActivity(callback: callback))
    }
    
    func deleteRequest(url : String, parameters : [String : Any], callback : @escaping (StravaResult<Activity, StravaError>) -> ()) {
        client.delete(url: url, parameters: parameters.flatten(), callback: parseActivity(callback: callback))
    }
    
    private func parseActivity(callback: @escaping (StravaResult<Activity, StravaError>) -> ()) -> (StravaResult<JSON, StravaError>) -> () {
        return { result in
            switch result {
            case let .success(json):
                if let activity = json.activity {
                    callback(.success(activity))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing activity")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
