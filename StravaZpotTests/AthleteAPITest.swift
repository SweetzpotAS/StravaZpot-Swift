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
    
    func testShouldGetAthleteTotalsAndStats() {
        let client = MockHTTPClient(respondWithJSON: STATS_JSON)
        let api = AthleteAPI(client: client)
        
        var result : StravaResult<Stats, StravaError>?
        api.getTotalsAndStats(withID: 227615).execute { result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athletes/227615/stats"))
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
    
    let STATS_JSON = "{" +
        "  \"biggest_ride_distance\": 175454.0," +
        "  \"biggest_climb_elevation_gain\": 1882.6999999999998," +
        "  \"recent_ride_totals\": {" +
        "    \"count\": 3," +
        "    \"distance\": 12054.900146484375," +
        "    \"moving_time\": 2190," +
        "    \"elapsed_time\": 2331," +
        "    \"elevation_gain\": 36.0," +
        "    \"achievement_count\": 0" +
        "  }," +
        "  \"recent_run_totals\": {" +
        "    \"count\": 23," +
        "    \"distance\": 195948.40002441406," +
        "    \"moving_time\": 65513," +
        "    \"elapsed_time\": 75232," +
        "    \"elevation_gain\": 2934.3999996185303," +
        "    \"achievement_count\": 46" +
        "  }," +
        "  \"recent_swim_totals\": {" +
        "    \"count\": 2," +
        "    \"distance\": 1117.2000122070312," +
        "    \"moving_time\": 1744," +
        "    \"elapsed_time\": 1942," +
        "    \"elevation_gain\": 0.0," +
        "    \"achievement_count\": 0" +
        "  }," +
        "  \"ytd_ride_totals\": {" +
        "    \"count\": 134," +
        "    \"distance\": 4927252," +
        "    \"moving_time\": 659982," +
        "    \"elapsed_time\": 892644," +
        "    \"elevation_gain\": 49940" +
        "  }," +
        "  \"ytd_run_totals\": {" +
        "    \"count\": 111," +
        "    \"distance\": 917100," +
        "    \"moving_time\": 272501," +
        "    \"elapsed_time\": 328059," +
        "    \"elevation_gain\": 7558" +
        "  }," +
        "  \"ytd_swim_totals\": {" +
        "    \"count\": 8," +
        "    \"distance\": 10372," +
        "    \"moving_time\": 8784," +
        "    \"elapsed_time\": 11123," +
        "    \"elevation_gain\": 0" +
        "  }," +
        "  \"all_ride_totals\": {" +
        "    \"count\": 375," +
        "    \"distance\": 15760015," +
        "    \"moving_time\": 2155741," +
        "    \"elapsed_time\": 2684286," +
        "    \"elevation_gain\": 189238" +
        "  }," +
        "  \"all_run_totals\": {" +
        "    \"count\": 272," +
        "    \"distance\": 2269557," +
        "    \"moving_time\": 673678," +
        "    \"elapsed_time\": 812095," +
        "    \"elevation_gain\": 23780" +
        "  }," +
        "  \"all_swim_totals\": {" +
        "    \"count\": 8," +
        "    \"distance\": 10372," +
        "    \"moving_time\": 8784," +
        "    \"elapsed_time\": 11123," +
        "    \"elevation_gain\": 0" +
        "  }" +
    "}"
}
