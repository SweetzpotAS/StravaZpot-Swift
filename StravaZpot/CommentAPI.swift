//
//  CommentAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class CommentAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func listActivityComments(withID id : Int) -> ListActivityCommentsRequest {
        return ListActivityCommentsRequest(client: client, id: id)
    }
}
