//
//  SegmentAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class SegmentAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func retrieveSegment(withID id : Int) -> RetrieveSegmentRequest {
        return RetrieveSegmentRequest(client: client, id: id)
    }
    
    public func listMyStarredSegments() -> ListMyStarredSegmentsRequest {
        return ListMyStarredSegmentsRequest(client: client)
    }
    
    public func listAthleteStarredSegments(withID id : Int) -> ListAthleteStarredSegmentsRequest {
        return ListAthleteStarredSegmentsRequest(client: client, id: id)
    }
    
    public func starSegment(withID id : Int) -> StarSegmentRequest {
        return StarSegmentRequest(client: client, id: id, starred: true)
    }
    
    public func unstarSegment(withID id : Int) -> StarSegmentRequest {
        return StarSegmentRequest(client: client, id: id, starred: false)
    }
    
    public func listSegmentEfforts(withID id : Int,
                                   forAthleteWithID athleteID : Int,
                                   withStartDate startDate : Date? = nil,
                                   withEndDate endDate : Date? = nil) -> ListSegmentEffortsRequest {
        return ListSegmentEffortsRequest(client: client, id: id, athleteID: athleteID, startDate: startDate, endDate: endDate)
    }
}
