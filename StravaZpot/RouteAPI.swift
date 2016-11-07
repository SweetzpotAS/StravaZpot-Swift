//
//  RouteAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class RouteAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func retrieveRoute(withID id : Int) -> RetrieveRouteRequest {
        return RetrieveRouteRequest(client: client, id: id)
    }
    
    public func listAthleteRoutes(withID id : Int) -> ListAthleteRoutesRequest {
        return ListAthleteRoutesRequest(client: client, id: id)
    }
}
