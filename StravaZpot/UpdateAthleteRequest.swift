//
//  UpdateAthleteRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class UpdateAthleteRequest {
    private let client : HTTPClient
    private let city : String?
    private let state : String?
    private let country : String?
    private let sex : Gender?
    private let weight : Double?
    
    init(client : HTTPClient, city : String?, state : String?, country : String?, sex : Gender?, weight : Double?) {
        self.client = client
        self.city = city
        self.state = state
        self.country = country
        self.sex = sex
        self.weight = weight
    }
    
    public func execute(callback : @escaping (StravaResult<Athlete>) -> ()) {
        let parameters = [ "city" : city,
                           "state" : state,
                           "country" : country,
                           "sex" : sex?.rawValue,
                           "weight" : weight] as [String : Any]
        
        client.put(url: "athlete", parameters: parameters.flatten()) { result in
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
