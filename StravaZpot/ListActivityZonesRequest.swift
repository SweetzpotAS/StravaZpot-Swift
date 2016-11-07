//
//  ListActivityZonesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListActivityZonesRequest : GetRequest<EquatableArray<ActivityZone>> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "activities/\(id)/zones", parse: { $0.activityZoneArray })
    }
}
