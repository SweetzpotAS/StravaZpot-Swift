//
//  KudosAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class KudosAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func listActivityKudos(withID id : Int) -> ListActivityKudosRequest {
        return ListActivityKudosRequest(client: client, id: id)
    }
}
