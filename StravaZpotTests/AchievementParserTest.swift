//
//  AchievementParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class AchievementParserTest: XCTestCase {
    
    func testJSONisParsedToAchievement() {
        let json = JSON(parseJSON: "{\"type_id\" : 2, \"type\" : \"overall\", \"rank\" : 3}")
        let parser = AchievementParser()
        
        let result = parser.from(json: json)
        let expected = Achievement(typeID: .overall, type: "overall", rank: 3)
        
        expect(result).to(equal(expected))
    }
    
}
