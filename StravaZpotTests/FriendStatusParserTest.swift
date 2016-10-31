//
//  FriendStatusParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class FriendStatusParserTest: XCTestCase {
    
    func testJSONisParsedToFriendStatus() {
        let json = JSON.parse("\"pending\"")
        let parser = FriendStatusParser()
        
        let result = parser.from(json: json)
        let expected = FriendStatus.pending
        
        expect(result).to(equal(expected))
    }
    
}
