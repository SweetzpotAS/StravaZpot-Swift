//
//  StreamAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class StreamAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func listActivityStreams(withID id : Int,
                                    forTypes types : StreamType...,
                                    withResolution resolution : Resolution? = nil,
                                    withSeriesType seriesType : SeriesType? = nil) -> ListActivityStreamsRequest {
        return ListActivityStreamsRequest(client: client, id: id, types: types, resolution: resolution, seriesType: seriesType)
    }
    
    public func listSegmentEffortStreams(withID id : Int,
                                         forTypes types : StreamType...,
                                         withResolution resolution : Resolution? = nil,
                                         withSeriesType seriesType : SeriesType? = nil) -> ListSegmentEffortStreamsRequest {
        return ListSegmentEffortStreamsRequest(client: client, id: id, types: types, resolution: resolution, seriesType: seriesType)
    }
}
