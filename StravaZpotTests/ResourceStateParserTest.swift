//
//  ResourceStateParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class ResourceStateParserTest : XCTestCase {
    
    func testJSONisParsedToResourceState() {
        let json = JSON.parse("2")
        let parser = ResourceStateParser()
        
        let result = parser.from(json: json)
        let expected = ResourceState.summary
        
        expect(result).to(equal(expected))
    }
}
