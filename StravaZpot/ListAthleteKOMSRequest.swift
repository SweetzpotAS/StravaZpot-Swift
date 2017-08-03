//
//  ListAthleteKOMSRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListAthleteKOMSRequest : GetRequest<EquatableArray<SegmentEffort>>, PaginatedRequest {
    private let id : Int
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        self.id = id
        super.init(client: client, url: "athletes/\(id)/koms", parse: { $0.segmentEffortArray })
    }
    
    override func getParameters() -> [String : Any] {
        return pageParameters()
    }
}
