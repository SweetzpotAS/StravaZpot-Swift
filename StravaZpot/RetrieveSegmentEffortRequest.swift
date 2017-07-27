//
//  RetrieveSegmentEffortRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class RetrieveSegmentEffortRequest : GetRequest<SegmentEffort> {
    init(client : HTTPClient, id : Int64) {
        super.init(client: client, url: "segment_efforts/\(id)", parse: { $0.segmentEffort })
    }
}
