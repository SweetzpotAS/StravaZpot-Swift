//
//  ListActivityLapsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListActivityLapsRequest : GetRequest<EquatableArray<ActivityLap>> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "activities/\(id)/laps", parse: { $0.activityLapArray })
    }
}
