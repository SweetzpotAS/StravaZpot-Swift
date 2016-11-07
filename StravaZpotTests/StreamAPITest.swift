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
    
}
