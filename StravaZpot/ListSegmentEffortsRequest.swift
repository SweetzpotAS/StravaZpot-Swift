//
//  ListSegmentEffortsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListSegmentEffortsRequest : GetRequest<EquatableArray<SegmentEffort>>, PaginatedRequest {
    private var parameters : [String : Any] = [:]
    internal var page : Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int, athleteID : Int, startDate : Date?, endDate : Date?) {
        parameters["athlete_id"] = athleteID
        parameters["start_date_local"] = startDate?.iso8601
        parameters["end_date_local"] = endDate?.iso8601
        super.init(client: client, url: "segments/\(id)/all_efforts", parse: { $0.segmentEffortArray })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters + pageParameters()
    }
}
