//
//  ListAthleteFollowersRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListAthleteFollowersRequest : GetRequest<EquatableArray<Athlete>>, PaginatedRequest {
    internal var page: Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "athletes/\(id)/followers", parse: { $0.athleteArray })
    }
    
    override func getParameters() -> [String : Any?] {
        return pageParameters()
    }
}
