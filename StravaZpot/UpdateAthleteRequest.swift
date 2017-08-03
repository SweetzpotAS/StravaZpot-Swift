//
//  UpdateAthleteRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class UpdateAthleteRequest : PutRequest<Athlete> {
    private var parameters : [String : Any] = [:]
    
    init(client : HTTPClient, city : String?, state : String?, country : String?, sex : Gender?, weight : Double?) {
        parameters["city"] = city
        parameters["state"] = state
        parameters["country"] = country
        parameters["sex"] = sex?.rawValue
        parameters["weight"] = weight
        super.init(client: client, url: "athlete", parse: { $0.athlete })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters
    }
}
