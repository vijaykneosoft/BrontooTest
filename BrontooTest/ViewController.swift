//
//  ViewController.swift
//  BrontooTest
//
//  Created by Webwerks on 01/07/19.
//  Copyright © 2019 Webwerks. All rights reserved.
//

import UIKit
import WebKit

extension Notification.Name {
    static let dataMessage = Notification.Name("dataMessage")
}


class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.navigationDelegate = self
        webView.uiDelegate = self
        loadURL()
    }
 
    // Loading url in webView
    private func loadURL() {
        let url = "https://test.ostaapp.com/webview/"
        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)
        
        let contentController = webView.configuration.userContentController
        contentController.add(self, name: "responseFromWV")
    }
    
    // Sending data to webView from device
    @IBAction func sendDataToWebView(_ sender: Any) {
        let js = "requestFromApp('This text is sent from app.');"
        webView.evaluateJavaScript(js) { (resp, error) in
            if error != nil {
                print(resp as! String)
            }
        }
    }
    
    // Getting data back from webView to device
    @IBAction func sendDataToDevice(_ sender: Any) {
        let js = "sendResponse();"
        webView.evaluateJavaScript(js) { (resp, error) in
            if error != nil {
                print(resp as! String)
            }
        }
    }
}
    
// MARK: - Delegate methods
extension ViewController: WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished®")
        webView.evaluateJavaScript("document.getElementById('responseBtn').innerText") { (resp, err) in
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        print(message)
        completionHandler()
    }

    // here we get data from callback handler of js
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "responseFromWV" {
            guard let msgBody = message.body as? String else {
                return
            }
            self.navigationController?.popViewController(animated: true)

            NotificationCenter.default.post(name: .dataMessage,
                                            object: nil,
                                            userInfo: ["msg": msgBody])
        }
    }
}
