//
//  GetGearRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class GetGearRequest : GetRequest<Gear> {
    init(client : HTTPClient, id : String) {
        super.init(client: client, url: "gear/\(id)", parse: { $0.gear })
    }
}
