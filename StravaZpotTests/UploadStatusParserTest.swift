//
//  UploadStatusParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class UploadStatusParserTest: XCTestCase {
    
    func testJSONIsParsedToUploadStatus() {
        let json = JSON(parseJSON: "{ \"id\": 16486788, \"external_id\": \"test.fit\", \"error\": null, \"status\": \"Your activity is still being processed.\", \"activity_id\": null }")
        let parser = UploadStatusParser()
        
        let result = parser.from(json: json)
        let expected = UploadStatus(id : 16486788, externalID: "test.fit", error : nil, status : "Your activity is still being processed.", activityID : nil)
        
        expect(result).to(equal(expected))
    }
    
}
