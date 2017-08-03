//
//  AuthenticationRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public class AuthenticationRequest : PostRequest<LoginResult> {
    private let parameters : [String : Any]
    
    init(client : HTTPClient, appCredentials : AppCredentials, code : String) {
        parameters = ["client_id" : appCredentials.cliendID, "client_secret" : appCredentials.clientSecret, "code" : code]
        super.init(client : client, url : "oauth/token", parse : { $0.loginResult })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters
    }
}
