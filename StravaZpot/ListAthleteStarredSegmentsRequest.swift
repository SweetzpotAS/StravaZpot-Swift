//
//  ListAthleteStarredSegmentsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListAthleteStarredSegmentsRequest : GetRequest<EquatableArray<Segment>> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "athletes/\(id)/segments/starred", parse: { $0.segmentArray })
    }
}
