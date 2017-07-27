//
//  PhotoAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class PhotoAPITest: XCTestCase {
    
    func testShouldListActivityPhotos() {
        let client = MockHTTPClient(respondWithJSON: PHOTOS_JSON)
        let api = PhotoAPI(client: client)
        
        var result : StravaResult<EquatableArray<Photo>>?
        api.listActivityPhotos(withID: 81121657).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("activities/81121657/photos"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["photo_sources"] as! Bool?).to(equal(true))
    }

    let PHOTOS_JSON = "[" +
        "  {" +
        "    \"id\": 10701863," +
        "    \"activity_id\": 81121657," +
        "    \"resource_state\": 2," +
        "    \"ref\": \"http://instagram.com/p/eAvA-tir85/\"," +
        "    \"uid\": \"540638730806542137_2865686\"," +
        "    \"caption\": \"City on a cottonbal\"," +
        "    \"type\": \"InstagramPhoto\"," +
        "    \"uploaded_at\": \"2013-09-08T19:39:40Z\"," +
        "    \"created_at\": \"2013-09-08T22:05:14Z\"," +
        "    \"location\": [" +
        "      -122.489833333," +
        "      37.839333333" +
        "    ]" +
        "  }," +
        "  {" +
        "    \"id\": 10701864," +
        "    \"activity_id\": 81121657," +
        "    \"resource_state\": 2," +
        "    \"ref\": \"http://instagram.com/p/eAujwACr7w/\"," +
        "    \"uid\": \"540636722145967856_2865686\"," +
        "    \"caption\": \"Daytime Ninja\"," +
        "    \"type\": \"InstagramPhoto\"," +
        "    \"uploaded_at\": \"2013-09-08T19:35:41Z\"," +
        "    \"created_at\": \"2013-09-08T22:05:14Z\"," +
        "    \"location\": [" +
        "      -122.487666667," +
        "      37.836" +
        "    ]" +
        "  }" +
    "]"
    
}
