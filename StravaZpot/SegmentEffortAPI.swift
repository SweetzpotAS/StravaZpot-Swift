//
//  SegmentEffortAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class SegmentEffortAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func retrieveSegmentEffort(withID id : Int64) -> RetrieveSegmentEffortRequest {
        return RetrieveSegmentEffortRequest(client: client, id: id)
    }
}
