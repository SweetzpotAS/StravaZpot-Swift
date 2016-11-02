//
//  StravaConfig.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct StravaConfig {
    let token : String
    let debug : Bool
    
    public init(token : String, debug : Bool = false) {
        self.token = token
        self.debug = debug
    }
    
    public func client() -> HTTPClient {
        return AlamofireHTTPClient(token: token, debug: debug)
    }
}
