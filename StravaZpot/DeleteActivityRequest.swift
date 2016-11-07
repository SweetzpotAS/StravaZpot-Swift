//
//  DeleteActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class DeleteActivityRequest : DeleteRequest<Bool> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "activities/\(id)", parse: { _ in true })
    }
}
