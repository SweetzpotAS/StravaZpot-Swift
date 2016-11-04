//
//  RetrieveClubRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class RetrieveClubRequest {
    private let client : HTTPClient
    private let id : Int
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<Club>) -> ()) {
        client.get(url: "clubs/\(id)", parameters: [:]) { result in
            switch(result) {
            case let .success(json):
                if let club = json.club {
                    callback(.success(club))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing club")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
