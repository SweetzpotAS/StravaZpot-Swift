//
//  AlamofireHTTPClient.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

class AlamofireHTTPClient : HTTPClient {
    private let token : String
    private let debug : Bool
    
    init(token : String, debug : Bool) {
        self.token = token
        self.debug = debug
    }
    
    func get(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        
    }
    
    func post(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        
    }
    
    func put(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        
    }
    
    func delete(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON, StravaError>) -> ()) {
        
    }
}
