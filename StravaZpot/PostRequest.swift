//
//  PostRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PostRequest<T : Equatable> {
    private let client : HTTPClient
    private let url : String
    private let parse : (JSON) -> T?
    
    init(client : HTTPClient, url : String, parse : @escaping (JSON) -> T?) {
        self.client = client
        self.url = url
        self.parse = parse
    }
    
    public func execute(callback : @escaping (StravaResult<T>) -> ()) {
        client.post(url: url, parameters: getParameters().flatten()){ result in
            switch(result) {
            case let .success(json):
                if let parsed = self.parse(json) {
                    callback(.success(parsed))
                } else {
                    callback(.error(StravaError.apiError(message: "Error parsing \(json)")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
    
    func getParameters() -> [String : Any] {
        return [:]
    }
}
