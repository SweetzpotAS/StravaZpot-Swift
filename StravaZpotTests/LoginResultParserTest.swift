//
//  LoginResultParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class LoginResultParserTest: XCTestCase {
    
    func testParsesLoginResultFromJSONCorrectly() {
        let json = JSON.parse("{\n" +
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
            "}")
        let parser = LoginResultParser()
        let result = parser.from(json: json)
        
        expect(result.token).to(equal(Token(value: "83ebeabdec09f6670863766f792ead24d61fe3f9")))
        expect(result.athlete).toNot(beNil())
    }
    
}
