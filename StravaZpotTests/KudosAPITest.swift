//
//  KudosAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class KudosAPITest : XCTestCase {
    
    func testShouldListActivityKudos() {
        let client = MockHTTPClient(respondWithJSON: "[]")
        let api = KudosAPI(client: client)
        
        var result : StravaResult<EquatableArray<Athlete>>?
        api.listActivityKudos(withID: 321934).of(page: 2, itemsPerPage: 10).execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.lastUrl).to(contain("activities/321934/kudos"))
        expect(client.getCalled).to(equal(true))
        expect(client.lastParameters["page"] as! Int?).to(equal(2))
        expect(client.lastParameters["per_page"] as! Int?).to(equal(10))
    }
}
