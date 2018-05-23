//
//  SkillLevelParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class SkillLevelParserTest: XCTestCase {
    
    func testJSONisParsedToSkillLevel() {
        let json = JSON(parseJSON: "1")
        let parser = SkillLevelParser()
        
        let result = parser.from(json: json)
        let expected = SkillLevel.casual
        
        expect(result).to(equal(expected))
    }
    
}
