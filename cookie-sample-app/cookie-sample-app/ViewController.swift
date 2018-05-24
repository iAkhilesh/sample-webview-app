//
//  ViewController.swift
//  cookie-sample-app
//
//  Created by CMGabriel on 5/24/18.
//  Copyright © 2018 AkhileshSharma. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    //Constant Values
    let urlString:String = "Location for the application";
    
    @IBOutlet weak var launchWebviewButton: UIButton!
    var wkWebView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func launchWebviewHandler(_ sender: Any) {
        print("Launch webview button tapped");
        self.initWebview();
    }
    
    func initWebview(){
        // This method initalizes the webview
        self.wkWebView = WKWebView();
        self.wkWebView.navigationDelegate = self;
        
        let webURL = URL(string:urlString);
        wkWebView.load(URLRequest(url: webURL!));
        wkWebView.allowsBackForwardNavigationGestures = true;
        wkWebView.frame = CGRect(origin: self.view.frame.origin, size: self.view.frame.size);
        self.view.addSubview(wkWebView);
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Webview finished loading");
        self.cookieStore();
    }
    
    func cookieStore(){
        //Following method access the http storage cookies
        //For iOS11
        let wkHttpCookieStorage = WKWebsiteDataStore.default().httpCookieStore;
        wkHttpCookieStorage.getAllCookies { (cookies) in
            for cookie in cookies {
                print("Cookie Name:\(cookie.name) - Cookie Value:\(cookie.value)");
            }
        }
    }
    
}

