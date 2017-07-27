//
//  StravaLoginTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class StravaLoginTest: XCTestCase {
    
    func testConstructsAValidURL() {
        let url = StravaLogin(clientID : 1234,
                              redirectURI : "http://www.sweetzpot.com/redirect",
                              approvalPrompt : .auto,
                              accessScope : .Public).makeURL()
        let expected = URL(string: "https://www.strava.com/oauth/authorize?response_type=code&client_id=1234&redirect_uri=http://www.sweetzpot.com/redirect&approval_prompt=auto&scope=public")
        
        expect(url).toNot(beNil())
        expect(url).to(equal(expected))
    }
    
}
