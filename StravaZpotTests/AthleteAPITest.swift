//
//  AthleteAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class AthleteAPITest: XCTestCase {
    
    func testShouldRetrieveCurrentAthlete() {
        let client = MockHTTPClient(respondWithJSON: ATHLETE_JSON)
        let api = AthleteAPI(client: client)
        
        var result : StravaResult<Athlete, StravaError>?
        api.retrieveCurrentAthlete().execute { result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athlete"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldRetrieveAnAthleteByID() {
        let client = MockHTTPClient(respondWithJSON: ATHLETE_JSON)
        let api = AthleteAPI(client: client)
        
        var result : StravaResult<Athlete, StravaError>?
        api.retrieveAthlete(withID: 227615).execute { result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athletes/227615"))
        expect(client.getCalled).to(equal(true))
    }
    
    func testShouldUpdateCurrentAthleteWithGivenValues() {
        let client = MockHTTPClient(respondWithJSON: ATHLETE_JSON)
        let api = AthleteAPI(client: client)
        
        var result : StravaResult<Athlete, StravaError>?
        api.updateCurrentAthlete(withCity: "Irvine", withState: "California", withCountry: "USA", withSex: .male, withWeight: 85.6).execute { result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athlete"))
        expect(client.putCalled).to(equal(true))
        expect(client.lastParameters["city"] as! String?).to(equal("Irvine"))
        expect(client.lastParameters["state"] as! String?).to(equal("California"))
        expect(client.lastParameters["country"] as! String?).to(equal("USA"))
        expect(client.lastParameters["sex"] as! String?).to(equal("M"))
        expect(client.lastParameters["weight"] as! Double?).to(equal(85.6))
        print(client.lastParameters)
    }
    
    func testShouldGetAthleteZones() {
        let client = MockHTTPClient(respondWithJSON: ZONES_JSON)
        let api = AthleteAPI(client: client)
        
        var result : StravaResult<Zones, StravaError>?
        api.getAthleteZones().execute { result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athlete/zones"))
        expect(client.getCalled).to(equal(true))
    }
    
    let ATHLETE_JSON = "{" +
        "  \"id\": 227615," +
        "  \"resource_state\": 3," +
        "  \"firstname\": \"John\"," +
        "  \"lastname\": \"Applestrava\"," +
        "  \"profile_medium\": \"http://pics.com/227615/medium.jpg\"," +
        "  \"profile\": \"http://pics.com/227615/large.jpg\"," +
        "  \"city\": \"San Francisco\"," +
        "  \"state\": \"California\"," +
        "  \"country\": \"United States\"," +
        "  \"sex\": \"M\"," +
        "  \"friend\": null," +
        "  \"follower\": null," +
        "  \"premium\": true," +
        "  \"created_at\": \"2008-01-01T17:44:00Z\"," +
        "  \"updated_at\": \"2013-09-04T20:00:50Z\"," +
        "  \"follower_count\": 273," +
        "  \"friend_count\": 19," +
        "  \"mutual_friend_count\": 0," +
        "  \"athlete_type\": 0," +
        "  \"date_preference\": \"%m/%d/%Y\"," +
        "  \"measurement_preference\": \"feet\"," +
        "  \"email\": \"john@applestrava.com\"," +
        "  \"ftp\": 280," +
        "  \"weight\": 68.7," +
        "  \"clubs\": [" +
        "    {" +
        "      \"id\": 1," +
        "      \"resource_state\": 2," +
        "      \"name\": \"Team Strava Cycling\"," +
        "      \"profile_medium\": \"http://pics.com/clubs/1/medium.jpg\"," +
        "      \"profile\": \"http://pics.com/clubs/1/large.jpg\"," +
        "      \"cover_photo\": \"http://pics.com/clubs/1/cover/large.jpg\"," +
        "      \"cover_photo_small\": \"http://pics.com/clubs/1/cover/small.jpg\"," +
        "      \"sport_type\": \"cycling\"," +
        "      \"city\": \"San Francisco\"," +
        "      \"state\": \"California\"," +
        "      \"country\": \"United States\"," +
        "      \"private\": true," +
        "      \"member_count\": 23," +
        "      \"featured\": false," +
        "      \"url\": \"strava-cycling\"" +
        "    }" +
        "  ]," +
        "  \"bikes\": [" +
        "    {" +
        "      \"id\": \"b105763\"," +
        "      \"primary\": false," +
        "      \"name\": \"Cannondale TT\"," +
        "      \"distance\": 476612.9," +
        "      \"resource_state\": 2" +
        "    }," +
        "    {" +
        "      \"id\": \"b105762\"," +
        "      \"primary\": true," +
        "      \"name\": \"Masi\"," +
        "      \"distance\": 9000578.2," +
        "      \"resource_state\": 2" +
        "    }" +
        "  ]," +
        "  \"shoes\": [" +
        "    {" +
        "      \"id\": \"g1\"," +
        "      \"primary\": true," +
        "      \"name\": \"Running Shoes\"," +
        "      \"distance\": 67492.9," +
        "      \"resource_state\": 2" +
        "    }" +
        "  ]" +
    "}"
    
    let ZONES_JSON = "{" +
        "  \"heart_rate\": {" +
        "    \"custom_zones\": false," +
        "    \"zones\": [" +
        "      { \"min\": 0, \"max\": 115 }," +
        "      { \"min\": 115, \"max\": 152 }," +
        "      { \"min\": 152, \"max\": 171 }," +
        "      { \"min\": 171, \"max\": 190 }," +
        "      { \"min\": 190,  \"max\": -1 }" +
        "    ]" +
        "  }," +
        "  \"power\": {" +
        "      \"zones\": [" +
        "        { \"min\": 0, \"max\": 180 }," +
        "        { \"min\": 181, \"max\": 246 }," +
        "        { \"min\": 247, \"max\": 295 }," +
        "        { \"min\": 296, \"max\": 344 }," +
        "        { \"min\": 345, \"max\": 393 }," +
        "        { \"min\": 394, \"max\": 492 }," +
        "        { \"min\": 493,  \"max\": -1 }" +
        "      ]" +
        "    }" +
    "}"
}
