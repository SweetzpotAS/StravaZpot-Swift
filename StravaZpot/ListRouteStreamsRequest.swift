//
//  ListRouteStreamsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListRouteStreamsRequest : GetRequest<EquatableArray<Stream>> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "routes/\(id)/streams", parse: { $0.streamArray })
    }
}
