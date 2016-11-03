//
//  AthleteArrayRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class AthleteArrayRequest {
    private let client : HTTPClient
    
    init(client : HTTPClient) {
        self.client = client
    }
    
    func request(url : String, parameters : [String : Any], callback: @escaping (StravaResult<EquatableArray<Athlete>, StravaError>) -> ()) {
        client.get(url: url, parameters: parameters) { result in
            switch(result) {
            case let .success(json):
                if let friends = json.athleteArray {
                    callback(.success(friends))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing athlete array")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
