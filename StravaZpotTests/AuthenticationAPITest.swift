//
//  AuthenticationAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class AuthenticationAPITest: XCTestCase {
    
    func testShouldSendAuthenticationRequest() {
        let client = MockHTTPClient(respondWithJSON: LOGIN_RESULT_JSON)
        let api = AuthenticationAPI(client: client)
        
        var result : StravaResult<LoginResult>?
        api.getToken(forApp: AppCredentials(clientID: 1234, clientSecret: "any_secret"), withCode: "any_code")
            .execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(equal("oauth/token"))
        expect(client.postCalled).to(equal(true))
        expect(client.lastParameters["client_id"] as! Int?).to(equal(1234))
        expect(client.lastParameters["client_secret"] as! String?).to(equal("any_secret"))
        expect(client.lastParameters["code"] as! String?).to(equal("any_code"))
    }
    
    let LOGIN_RESULT_JSON = "{\n" +
        "  \"access_token\": \"83ebeabdec09f6670863766f792ead24d61fe3f9\",\n" +
        "  \"athlete\": {\n" +
        "    \"id\": 227615,\n" +
        "    \"resource_state\": 3,\n" +
        "    \"firstname\": \"John\",\n" +
        "    \"lastname\": \"Applestrava\",\n" +
        "    \"profile_medium\": \"http://pics.com/227615/medium.jpg\",\n" +
        "    \"profile\": \"http://pics.com/227615/large.jpg\",\n" +
        "    \"city\": \"San Francisco\",\n" +
        "    \"state\": \"California\",\n" +
        "    \"country\": \"United States\",\n" +
        "    \"sex\": \"M\",\n" +
        "    \"friend\": null,\n" +
        "    \"follower\": null,\n" +
        "    \"premium\": true,\n" +
        "    \"created_at\": \"2008-01-01T17:44:00Z\",\n" +
        "    \"updated_at\": \"2013-09-04T20:00:50Z\",\n" +
        "    \"follower_count\": 273,\n" +
        "    \"friend_count\": 19,\n" +
        "    \"mutual_friend_count\": 0,\n" +
        "    \"date_preference\": \"%m/%d/%Y\",\n" +
        "    \"measurement_preference\": \"feet\",\n" +
        "    \"email\": \"john@applestrava.com\",\n" +
        "    \"clubs\": [ ],\n" +
        "    \"bikes\": [ ],\n" +
        "    \"shoes\": [ ]\n" +
        "  }\n" +
    "}"
}
