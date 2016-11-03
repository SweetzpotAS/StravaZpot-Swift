//
//  AlamofireHTTPClient.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class AlamofireHTTPClient : HTTPClient {
    private let baseURL : String
    private let token : String
    private let debug : Bool
    private var headers : HTTPHeaders {
        get {
            return [
                "Authorization": token,
                "Accept": "application/json"
            ]
        }
    }
    
    init(baseURL : String, token : String, debug : Bool) {
        self.baseURL = baseURL
        self.token = token
        self.debug = debug
    }
    
    func get(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        request(url: url, method: .get, parameters: parameters, callback: callback)
    }
    
    func post(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        request(url: url, method: .post, parameters: parameters, callback: callback)
    }
    
    func put(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        request(url: url, method: .put, parameters: parameters, callback: callback)
    }
    
    func delete(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        request(url: url, method: .delete, parameters: parameters, callback: callback)
    }
    
    private func request(url : String, method: HTTPMethod, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ()) {
        
        Alamofire.request(baseURL + url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseJSON { response in
                if(self.debug) {
                    debugPrint(response)
                }
                
                if let result = response.result.value {
                    callback(.success(JSON(result)))
                } else {
                    if response.response?.statusCode == 401 {
                        callback(.error(.unauthorized(message: "Unauthorized access. Request a new token.")))
                    } else {
                        callback(.error(.apiError(message: "Strava API Error")))
                    }
                }
        }
    }
}
