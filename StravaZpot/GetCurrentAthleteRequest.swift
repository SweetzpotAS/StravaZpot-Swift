//
//  GetCurrentAthleteRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class GetCurrentAthleteRequest : GetRequest<Athlete> {
    init(client: HTTPClient) {
        super.init(client: client, url: "athlete", parse: { $0.athlete })
    }
}
