//
//  StarSegmentRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class StarSegmentRequest : PutRequest<Segment> {
    private let parameters : [String : Any?]
    
    init(client : HTTPClient, id : Int, starred : Bool) {
        parameters = [ "starred" : starred ]
        super.init(client: client, url: "segments/\(id)/starred", parse: { $0.segment })
    }
    
    override func getParameters() -> [String : Any?] {
        return parameters
    }
}
