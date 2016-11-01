//
//  PhotoParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 1/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class PhotoParserTest: XCTestCase {
    
    func testJSONisParsedToPhoto() {
        let json = JSON.parse("  {" +
            "    \"id\": 10701863," +
            "    \"activity_id\": 81121657," +
            "    \"resource_state\": 2," +
            "    \"ref\": \"http://instagram.com/p/eAvA-tir85/\"," +
            "    \"uid\": \"540638730806542137_2865686\"," +
            "    \"caption\": \"City on a cottonbal\"," +
            "    \"type\": \"InstagramPhoto\"," +
            "    \"uploaded_at\": \"2013-09-08T19:39:40Z\"," +
            "    \"created_at\": \"2013-09-08T22:05:14Z\"," +
            "    \"location\": [" +
            "      -122.489833333," +
            "      37.839333333" +
            "    ]" +
            "  }")
        let parser = PhotoParser()
        
        let result = parser.from(json: json)
        let expected = Photo(uniqueID: nil,
                             id: 10701863,
                             activityID: 81121657,
                             resourceState: .summary,
                             urls: [:],
                             caption: "City on a cottonbal",
                             source: nil,
                             uploadedAt: Date(day: 8, month: 9, year: 2013, hour: 19, minute: 39, second: 40),
                             createdAt: Date(day: 8, month: 9, year: 2013, hour: 22, minute: 5, second: 14),
                             location: Coordinates(latitude: -122.489833333, longitude: 37.839333333),
                             ref: "http://instagram.com/p/eAvA-tir85/",
                             uid: "540638730806542137_2865686",
                             type: "InstagramPhoto")
        
        expect(result).to(equal(expected))
    }
    
}
