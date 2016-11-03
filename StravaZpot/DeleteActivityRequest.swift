//
//  DeleteActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class DeleteActivityRequest {
    private let client : HTTPClient
    private let id : Int
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<Bool>) -> ()) {
        client.delete(url: "activities/\(id)", parameters: [:], callback: { result in
            switch(result) {
            case .success(_):
                callback(.success(true))
            case let .error(content):
                callback(.error(content))
            }
        })
    }
}
