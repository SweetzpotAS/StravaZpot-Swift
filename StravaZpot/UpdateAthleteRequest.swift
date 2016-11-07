//
//  UpdateAthleteRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class UpdateAthleteRequest : PutRequest<Athlete> {
    private let parameters : [String : Any]
    
    init(client : HTTPClient, city : String?, state : String?, country : String?, sex : Gender?, weight : Double?) {
        parameters = [ "city" : city,
                       "state" : state,
                       "country" : country,
                       "sex" : sex?.rawValue,
                       "weight" : weight] as [String : Any]
        super.init(client: client, url: "athlete", parse: { $0.athlete })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters
    }
}
