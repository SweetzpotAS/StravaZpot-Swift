//
//  GearAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class GearAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func getGear(withID id : String) -> GetGearRequest {
        return GetGearRequest(client: client, id: id)
    }
}
