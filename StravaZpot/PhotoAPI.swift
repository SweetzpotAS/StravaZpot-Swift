//
//  PhotoAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class PhotoAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func listActivityPhotos(withID id : Int) -> ListActivityPhotosRequest {
        return ListActivityPhotosRequest(client: client, id: id)
    }
}
