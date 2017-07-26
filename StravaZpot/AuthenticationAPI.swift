//
//  AuthenticationAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public class AuthenticationAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func getToken(forApp app : AppCredentials, withCode code : String) -> AuthenticationRequest {
        return AuthenticationRequest(client: client, appCredentials: app, code: code)
    }
}
