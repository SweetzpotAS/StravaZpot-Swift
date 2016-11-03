//
//  FriendAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class FriendAPITest: XCTestCase {
    
    func testShouldListMyFriends() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = FriendAPI(client: client)
        
        var result : StravaResult<EquatableArray<Athlete>, StravaError>?
        api.listMyFriends().of(page: 2, itemsPerPage: 10).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athlete/friends"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["page"] as! Int?).to(equal(2))
        expect(client.lastParameters["per_page"] as! Int?).to(equal(10))
    }
    
    func testShouldListAthleteFriends() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = FriendAPI(client: client)
        
        var result : StravaResult<EquatableArray<Athlete>, StravaError>?
        api.listAhtleteFriends(withID: 227615).of(page: 2, itemsPerPage: 10).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("athletes/227615/friends"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["page"] as! Int?).to(equal(2))
        expect(client.lastParameters["per_page"] as! Int?).to(equal(10))
    }
}
