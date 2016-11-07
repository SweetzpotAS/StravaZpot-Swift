//
//  RetrieveAthleteRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class RetrieveAthleteRequest : GetRequest<Athlete> {
    init(client : HTTPClient, id : Int) {
        super.init(client : client, url: "athletes/\(id)", parse: { $0.athlete })
    }
}
