//
//  CommentAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class CommentAPITest: XCTestCase {
    
    func testShouldListActivityComments() {
        let client = MockHTTPClient(respondWithJSON: COMMENTS_JSON)
        let api = CommentAPI(client: client)
        
        var result : StravaResult<EquatableArray<Comment>>?
        api.listActivityComments(withID: 123).of(page: 2, itemsPerPage: 10).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("activities/123/comments"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["page"] as! Int?).to(equal(2))
        expect(client.lastParameters["per_page"] as! Int?).to(equal(10))
    }
    
    let COMMENTS_JSON = "[" +
        "  {" +
        "    \"id\": 26," +
        "    \"activity_id\": 123," +
        "    \"resource_state\": 2," +
        "    \"text\": \"Nice ride!!!\"," +
        "    \"athlete\": {" +
        "      \"id\": 227615," +
        "      \"resource_state\": 2," +
        "      \"firstname\": \"John\"," +
        "      \"lastname\": \"Applestrava\"," +
        "      \"profile_medium\": \"http://pics.com/227615/medium.jpg\"," +
        "      \"profile\": \"http://pics.com/227615//large.jpg\"," +
        "      \"city\": \"San Francisco\"," +
        "      \"state\": \"California\"," +
        "      \"country\": \"United States\"," +
        "      \"sex\": \"M\"," +
        "      \"friend\": \"accepted\"," +
        "      \"follower\": \"accepted\"," +
        "      \"premium\": true," +
        "      \"created_at\": \"2009-08-26T13:42:05Z\"," +
        "      \"updated_at\": \"2013-01-11T18:51:00Z\"" +
        "    }," +
        "    \"created_at\": \"2013-09-06T21:07:22Z\"" +
        "  }" +
    "]"
}
