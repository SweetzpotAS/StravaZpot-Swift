//
//  AuthenticationViewController.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import UIKit

public protocol AuthenticationDelegate {
    func authenticationViewController(_ authenticationViewController : AuthenticationViewController, didFinishWithCode code : String)
}

public class AuthenticationViewController: UIViewController, UIWebViewDelegate {
    
    public var url : URL!
    public var redirectURL : String!
    public var delegate : AuthenticationDelegate!
    private var webView : UIWebView!
    
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UserDefaults.standard.register(defaults: ["UserAgent": "StravaZpot"])
        self.webView = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(webView)
        self.webView.loadRequest(URLRequest(url: self.url))
        self.webView.delegate = self
    }
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let loadingURL = request.mainDocumentURL,
            let code = loadingURL.valueOf(queryParameterName: "code"){
            if loadingURL.absoluteString.hasPrefix(redirectURL) {
                self.delegate.authenticationViewController(self, didFinishWithCode: code)
                return false
            }
        }
        return true
    }
    
}
