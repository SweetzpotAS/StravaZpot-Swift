//
//  MembershipParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class MembershipParserTest: XCTestCase {
    
    func testJSONisParsedToMembership() {
        let json = JSON(parseJSON: "\"member\"")
        let parser = MembershipParser()
        
        let result = parser.from(json: json)
        let expected = Membership.member
        
        expect(result).to(equal(expected))
    }
    
}
