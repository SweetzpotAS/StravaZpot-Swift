//
//  ListMyStarredSegmentsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListMyStarredSegmentsRequest : GetRequest<EquatableArray<Segment>> {
    init(client : HTTPClient) {
        super.init(client: client, url: "segments/starred", parse: { $0.segmentArray })
    }
}
