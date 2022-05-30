//
//  AuthenticationViewController.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import WebKit

public protocol AuthenticationDelegate {
    func authenticationViewController(_ authenticationViewController : AuthenticationViewController, didFinishWithCode code : String)
}

public class AuthenticationViewController: UIViewController, WKNavigationDelegate {
    
    public var url : URL!
    public var redirectURL : String!
    public var delegate : AuthenticationDelegate!
    private var webView : WKWebView!
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(webView)
        self.webView.load(URLRequest(url: self.url))
        self.webView.navigationDelegate = self
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let loadingURL = navigationAction.request.url,
            let code = loadingURL.valueOf(queryParameterName: "code") {
            if loadingURL.absoluteString.hasPrefix(redirectURL) {
                self.delegate.authenticationViewController(self, didFinishWithCode: code)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
}
