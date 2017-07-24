//
//  ListActivityCommentsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListActivityCommentsRequest : GetRequest<EquatableArray<Comment>>, PaginatedRequest {
    internal var page : Int?
    internal var perPage: Int?
    
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "activities/\(id)/comments", parse: { $0.commentArray })
    }
    
    override func getParameters() -> [String : Any?] {
        return pageParameters()
    }
}
