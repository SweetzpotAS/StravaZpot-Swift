//
//  RetrieveRouteRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class RetrieveRouteRequest : GetRequest<Route> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "routes/\(id)", parse: { $0.route })
    }
}
