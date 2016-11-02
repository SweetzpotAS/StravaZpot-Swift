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
    private let response : StravaResult<JSON, StravaError>
    var getCalled = false
    var postCalled = false
    var putCalled = false
    var deleteCalled = false
    var lastUrl = ""
    var lastParameters : [String : Any] = [:]
    
    init(respondWithJSON json : String) {
        self.response = .success(JSON.parse(json))
    }
    
    init(respondWithError error : StravaError) {
        self.response = .error(error)
    }
    
    func get(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        self.getCalled = true
        request(url: url, parameters: parameters, callback: callback)
    }
    
    func post(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        self.postCalled = true
        request(url: url, parameters: parameters, callback: callback)
    }
    
    func put(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        self.putCalled = true
        request(url: url, parameters: parameters, callback: callback)
    }
    
    func delete(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        self.deleteCalled = true
        request(url: url, parameters: parameters, callback: callback)
    }
    
    private func request(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        self.lastUrl = url
        self.lastParameters = parameters
        callback(response)
    }
}
