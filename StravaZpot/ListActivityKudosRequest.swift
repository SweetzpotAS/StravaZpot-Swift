//
//  ListActivityKudosRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListActivityKudosRequest : GetRequest<EquatableArray<Athlete>>, PaginatedRequest {
    internal var page : Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "activities/\(id)/kudos", parse: { $0.athleteArray })
    }
    
    override func getParameters() -> [String : Any] {
        return pageParameters()
    }
}
