//
//  PhotoSummaryParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class PhotoSummaryParserTest: XCTestCase {
    
    func testJSONisParsedToPhotoSummary() {
        let json = JSON.parse("{\"count\" : 3, \"primary\" : {\"id\" : 1234, \"source\" : 1, \"urls\" : {}} }")
        let parser = PhotoSummaryParser()
        
        let result = parser.from(json: json)
        let expected = PhotoSummary(count: 3, primary: PrimaryPhoto(id: 1234, uniqueID: nil, source: .strava, urls : [:]))
        
        expect(result).to(equal(expected))
    }
    
}
