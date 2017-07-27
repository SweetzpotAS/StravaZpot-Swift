//
//  GetTotalsAndStatsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class GetTotalsAndStatsRequest : GetRequest<Stats> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "athletes/\(id)/stats", parse: { $0.stats })
    }
}
