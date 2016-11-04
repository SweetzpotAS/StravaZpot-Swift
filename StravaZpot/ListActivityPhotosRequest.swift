//
//  ListActivityPhotosRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListActivityPhotosRequest {
    private let client : HTTPClient
    private let id : Int
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Photo>>) -> ()) {
        let parameters = ["photo_sources" : true] as [String : Any]
        client.get(url: "activities/\(id)/photos", parameters: parameters){ result in
            switch(result){
            case let .success(json):
                if let photos = json.photoArray {
                    callback(.success(photos))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing photo array")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
