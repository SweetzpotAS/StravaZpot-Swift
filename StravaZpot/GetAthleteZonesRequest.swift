//
//  GetAthleteZonesRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class GetAthleteZonesRequest : GetRequest<Zones> {
    init(client: HTTPClient) {
        super.init(client: client, url: "athlete/zones", parse: { $0.zones })
    }
}
