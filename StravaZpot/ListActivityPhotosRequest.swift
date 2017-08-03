//
//  ListActivityPhotosRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListActivityPhotosRequest : GetRequest<EquatableArray<Photo>> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "activities/\(id)/photos", parse: { $0.photoArray })
    }
    
    override func getParameters() -> [String : Any] {
        return ["photo_sources" : true]
    }
}
