//
//  UploadAPITest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
@testable import StravaZpot

class UploadAPITest: XCTestCase {
    
    func testShouldUploadAFile() {
        let client = MockHTTPClient(respondWithJSON: UPLOAD_STATUS_JSON)
        let api = UploadAPI(client: client)
        
        var result : StravaResult<UploadStatus>?
        api.upload(file : URL(string: "file://path_to_file")!,
                   withFilename : "filename.fit",
                   withDataType : .fit,
                   withActivityType : .ride,
                   withName : "A complete ride around the city",
                   withDescription : "No description",
                   isPrivate : false,
                   hasTrainer : false,
                   isCommute : false,
                   withExternalID : "test.fit")
            .execute{ result = $0 }
    
        expect(result).toEventually(beSuccessful())
        expect(client.uploadCalled).to(equal(true))
        expect(client.lastUrl).to(equal("uploads"))
        expect(client.lastParameters["data_type"] as! Data?).to(equal("fit".data(using: .utf8)))
        expect(client.lastParameters["activity_type"] as! Data?).to(equal("ride".data(using: .utf8)))
        expect(client.lastParameters["name"] as! Data?).to(equal("A complete ride around the city".data(using: .utf8)))
        expect(client.lastParameters["description"] as! Data?).to(equal("No description".data(using: .utf8)))
        expect(client.lastParameters["private"] as! Data?).to(equal("0".data(using: .utf8)))
        expect(client.lastParameters["trainer"] as! Data?).to(equal("0".data(using: .utf8)))
        expect(client.lastParameters["commute"] as! Data?).to(equal("0".data(using: .utf8)))
        expect(client.lastParameters["external_id"] as! Data?).to(equal("test.fit".data(using: .utf8)))
        expect(client.lastFile).to(equal(URL(string: "file://path_to_file")))
        expect(client.lastKey).to(equal("file"))
        expect(client.lastFilename).to(equal("filename.fit"))
        expect(client.lastMimeType).to(equal("multipart/form-data"))
    }
    
    func testShouldCheckUploadStatus() {
        let client = MockHTTPClient(respondWithJSON: UPLOAD_STATUS_JSON)
        let api = UploadAPI(client: client)
        
        var result : StravaResult<UploadStatus>?
        api.checkUploadStatus(withId: 16486788)
            .execute{ result = $0 }
        
        expect(result).toEventually(beSuccessful())
        expect(client.getCalled).to(equal(true))
        expect(client.lastUrl).to(equal("uploads/16486788"))
    }
    
    let UPLOAD_STATUS_JSON = "{\n" +
        "  \"id\": 16486788,\n" +
        "  \"external_id\": \"test.fit\",\n" +
        "  \"error\": null,\n" +
        "  \"status\": \"Your activity is still being processed.\",\n" +
        "  \"activity_id\": null\n" +
    "}"
    
}
