//
//  StravaLogin.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public struct StravaLogin {
    private let STRAVA_LOGIN_URL = "https://www.strava.com/oauth/authorize?response_type=code"
    let clientID : Int
    let redirectURI : String?
    let approvalPrompt : ApprovalPrompt?
    let accessScope : AccessScope?
    
    public init(clientID : Int, redirectURI : String? = nil, approvalPrompt : ApprovalPrompt?, accessScope : AccessScope?) {
        self.clientID = clientID
        self.redirectURI = redirectURI
        self.approvalPrompt = approvalPrompt
        self.accessScope = accessScope
    }
    
    public func makeURL() -> URL? {
        let url = STRAVA_LOGIN_URL + clientIDParameter() + redirectURIParameter() + approvalPromptParameter() + accessScopeParameter()
        return URL(string: url)
    }
    
    private func clientIDParameter() -> String {
        return "&client_id=\(clientID)"
    }
    
    private func redirectURIParameter() -> String {
        return redirectURI.flatMap{ redirectURI in "&redirect_uri=\(redirectURI)" } ?? ""
    }
    
    private func approvalPromptParameter() -> String {
        return approvalPrompt.flatMap{ approvalPrompt in "&approval_prompt=\(approvalPrompt.rawValue)" } ?? ""
    }
    
    private func accessScopeParameter() -> String {
        return accessScope.flatMap{ accessScope in "&scope=\(accessScope.rawValue)" } ?? ""
    }
}
