//
//  ListSegmentEffortsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListSegmentEffortsRequest : GetRequest<EquatableArray<SegmentEffort>>, PaginatedRequest {
    private let parameters : [String : Any]
    internal var page : Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int, athleteID : Int, startDate : Date?, endDate : Date?) {
        parameters = [ "athlete_id" : athleteID,
                       "start_date_local" : startDate?.iso8601,
                       "end_date_local" : endDate?.iso8601 ]
        super.init(client: client, url: "segments/\(id)/all_efforts", parse: { $0.segmentEffortArray })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters + pageParameters()
    }
}
