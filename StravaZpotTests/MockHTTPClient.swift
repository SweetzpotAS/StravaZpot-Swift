//
//  MockHTTPClient.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON
@testable import StravaZpot

class MockHTTPClient : HTTPClient {
    private let response : StravaResult<JSON>
    var getCalled = false
    var postCalled = false
    var putCalled = false
    var deleteCalled = false
    var uploadCalled = false
    var lastUrl = ""
    var lastParameters : [String : Any] = [:]
    var lastFile : URL? = nil
    var lastKey = ""
    var lastFilename = ""
    var lastMimeType = ""
    
    init(respondWithJSON json : String) {
        self.response = .success(JSON(parseJSON: json))
    }
    
    init(respondWithError error : StravaError) {
        self.response = .error(error)
    }
    
    func get(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        self.getCalled = true
        request(url: url, parameters: parameters, callback: callback)
    }
    
    func post(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        self.postCalled = true
        request(url: url, parameters: parameters, callback: callback)
    }
    
    func put(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        self.putCalled = true
        request(url: url, parameters: parameters, callback: callback)
    }
    
    func delete(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        self.deleteCalled = true
        request(url: url, parameters: parameters, callback: callback)
    }
    
    func upload(file : URL, withKey key : String, withName name : String, toUrl url : String, parameters : [String : Data], mimeType : String, callback : @escaping (StravaResult<JSON>) -> ()) {
        self.uploadCalled = true
        self.lastUrl = url
        self.lastParameters = parameters
        self.lastFile = file
        self.lastKey = key
        self.lastFilename = name
        self.lastMimeType = mimeType
        callback(response)
    }
    
    private func request(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        self.lastUrl = url
        self.lastParameters = parameters
        callback(response)
    }
}
