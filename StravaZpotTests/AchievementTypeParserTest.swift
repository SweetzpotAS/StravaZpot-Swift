//
//  AchievementTypeParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class AchievementTypeParserTest: XCTestCase {
    
    func testJSONisParsedToAchievementType() {
        let json = JSON.parse("2")
        let parser = AchievementTypeParser()
        
        let result = parser.from(json: json)
        let expected = AchievementType.overall
        
        expect(result).to(equal(expected))
    }
}
