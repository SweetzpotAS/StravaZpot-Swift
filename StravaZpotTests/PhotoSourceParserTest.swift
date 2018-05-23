//
//  PhotoSourceParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import SwiftyJSON
import Nimble
@testable import StravaZpot

class PhotoSourceParserTest: XCTestCase {
    
    func testJSONisParsedToPhotoSource() {
        let json = JSON(parseJSON: "1")
        let parser = PhotoSourceParser()
        
        let result = parser.from(json: json)
        let expected = PhotoSource.strava
        
        expect(result).to(equal(expected))
    }
    
}
