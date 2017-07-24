//
//  ListActivityStreamsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListActivityStreamsRequest : GetRequest<EquatableArray<Stream>> {
    private let parameters : [String : Any?]
    
    init(client : HTTPClient, id : Int, types : [StreamType], resolution : Resolution?, seriesType : SeriesType?) {
        parameters = [ "resolution" : resolution?.rawValue,
                       "series_type" : seriesType?.rawValue ]
        let streamTypes = types.map{ $0.rawValue }.joined(separator: ",")
        super.init(client: client, url: "activities/\(id)/streams/\(streamTypes)", parse: { $0.streamArray })
    }
    
    override func getParameters() -> [String : Any?] {
        return parameters
    }
}
