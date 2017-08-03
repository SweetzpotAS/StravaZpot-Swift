//
//  RetrieveSegmentLeaderboardsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class RetrieveSegmentLeaderboardsRequest : GetRequest<Leaderboard>, PaginatedRequest {
    private var parameters : [String : Any] = [:]
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int, gender : Gender?, ageGroup : AgeGroup?, weightClass : WeightClass?, following : Bool?, clubID : Int?, dateRange : DateRange?, contextEntries : Int?) {
        parameters["gender"] = gender?.rawValue
        parameters["age_group"] = ageGroup?.rawValue
        parameters["weight_class"] = weightClass?.rawValue
        parameters["following"] = following
        parameters["club_id"] = clubID
        parameters["date_range"] = dateRange?.rawValue
        parameters["context_entries"] = contextEntries
        super.init(client: client, url: "segments/\(id)/leaderboard", parse: { $0.leaderboard })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters + pageParameters()
    }
}
