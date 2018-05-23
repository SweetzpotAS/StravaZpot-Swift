//
//  PrimaryPhotoParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class PrimaryPhotoParserTest: XCTestCase {
    
    func testJSONisParsedToPrimaryPhoto() {
        let json = JSON(parseJSON: "{\"unique_id\" : \"abcd\", \"source\" : 2, \"urls\" : {\"100\" : \"url1\", \"600\" : \"url2\"}}")
        let parser = PrimaryPhotoParser()
        
        let result = parser.from(json: json)
        let expected = PrimaryPhoto(id: nil,
                                    uniqueID: "abcd",
                                    source: .instagram,
                                    urls: ["100" : "url1", "600" : "url2"])
        
        expect(result).to(equal(expected))
    }
    
}
