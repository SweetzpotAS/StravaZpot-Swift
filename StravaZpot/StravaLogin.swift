//
//  StravaLogin.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation
import AuthenticationServices

@available(iOS 12.0, *)
public class StravaLogin: NSObject {
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
        var urlPrefix = STRAVA_LOGIN_URL
        
//        let nativeStravaAppLink = "strava://oauth/mobile/authorize?response_type=code"
//        if UIApplication.shared.canOpenURL(URL(string: nativeStravaAppLink)) {
//
//        }
        
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
    
    var webAuthSession: ASWebAuthenticationSession?
    public func authenticate(completion: @escaping (String) -> Void) {
        
        webAuthSession = ASWebAuthenticationSession.init(url: makeURL()!, callbackURLScheme: redirectURI!, completionHandler: { (callBack:URL?, error:Error?) in

            // handle auth response
            guard error == nil, let successURL = callBack else {
                print(error.debugDescription)
                return
            }

            if let oauthToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == "code"}).first?.value {
                print("Strava OAuth Token: \(oauthToken)")
                completion(oauthToken)
            }
        })
        
        if #available(iOS 13.0, *) {
            webAuthSession?.presentationContextProvider = self
        }

        // Kick it off
        webAuthSession?.start()
        
    }
    
    
}

@available(iOS 12.0, *)
extension StravaLogin: ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return UIApplication.topViewController()?.view.window ?? ASPresentationAnchor()
    }
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
