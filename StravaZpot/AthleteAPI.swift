//
//  AthleteAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class AthleteAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func retrieveCurrentAthlete() -> GetCurrentAthleteRequest {
        return GetCurrentAthleteRequest(client: client)
    }
}
