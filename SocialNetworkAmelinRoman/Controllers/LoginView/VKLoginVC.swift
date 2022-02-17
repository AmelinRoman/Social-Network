//
//  VKLoginVC.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 14.02.2022.
//

import UIKit
import WebKit

final class VKLoginVC: UIViewController {
    
    private let GoToMySocialNetworkIdentifier = "GoToMySocialNetwork"
    var session = UserSession.instance

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
   @IBAction func unwindToVKLogin(_ segue: UIStoryboardSegue) {
        session.token = ""
        session.userId = 0
        
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: { records in
            records.forEach{
                if $0.displayName.contains("vk") {
                    dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(),
                                         for: [$0],
                                         completionHandler: { [weak self] in
                        guard
                            let self = self,
                            let request = NetworkService().loadAuthorizeVK()
                        else { return }
                        self.webView.load(request)
                    })
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let request = NetworkService().loadAuthorizeVK() else {return}
        webView.load(request)
    }
}

extension VKLoginVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
                url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let parametrs = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String: String]()) { partialResult, params in
                var dict = partialResult
                let key = params[0]
                let value = params[1]
                dict[key] = value
                return dict
            }
        if let token = parametrs["access_token"],
           let userIdString = parametrs["user_id"],
           let userID = Int(userIdString) {
            session.token = token
            session.userId = userID
            
            performSegue(withIdentifier: GoToMySocialNetworkIdentifier, sender: nil)
            
            decisionHandler(.cancel)
        }
    }
}
