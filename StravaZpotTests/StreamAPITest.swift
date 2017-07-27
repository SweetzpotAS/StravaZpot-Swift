//
//  StreamAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class StreamAPITest: XCTestCase {
    
    func testShouldListActivityStreams() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = StreamAPI(client: client)
        
        var result : StravaResult<EquatableArray<StravaZpot.Stream>>?
        api.listActivityStreams(withID: 112233, forTypes: .altitude, .time, .temperature, withResolution: .low, withSeriesType: .time).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("activities/112233/streams/altitude,time,temp"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["resolution"] as! String?).to(equal("low"))
        expect(client.lastParameters["series_type"] as! String?).to(equal("time"))
    }
    
    func testShouldListSegmentEffortStreams() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = StreamAPI(client: client)
        
        var result : StravaResult<EquatableArray<StravaZpot.Stream>>?
        api.listSegmentEffortStreams(withID: 112233, forTypes: .altitude, .time, .temperature, withResolution: .low, withSeriesType: .time).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segment_efforts/112233/streams/altitude,time,temp"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["resolution"] as! String?).to(equal("low"))
        expect(client.lastParameters["series_type"] as! String?).to(equal("time"))
    }
    
    func testShouldListSegmentStreams() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = StreamAPI(client: client)
        
        var result : StravaResult<EquatableArray<StravaZpot.Stream>>?
        api.listSegmentStreams(withID: 112233, forTypes: .altitude, .time, .temperature, withResolution: .low, withSeriesType: .time).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("segment/112233/streams/altitude,time,temp"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["resolution"] as! String?).to(equal("low"))
        expect(client.lastParameters["series_type"] as! String?).to(equal("time"))
    }
    
    func testShouldListRouteStreams() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = StreamAPI(client: client)
        
        var result : StravaResult<EquatableArray<StravaZpot.Stream>>?
        api.listRouteStreams(withID: 112233).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("routes/112233/streams"))
        expect(client.getCalled).to(equal(true))
    }
}
