//
// KittyViewController.swift
//
// Copyright 2017 Handsome LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import InteractiveSideMenu
import WebKit

/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class KittyViewController: UIViewController, SideMenuItemContent, Storyboardable,WKNavigationDelegate,WKUIDelegate {

    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var webView : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.viewContainer.addSubview(self.webView!)
        self.webView!.navigationDelegate = self;
        self.webView!.uiDelegate = self;
        let url = URL(string: "https://www.teknomacera.com/")
        webView!.evaluateJavaScript("document.getElementsByClassName('mkdf-mobile-header')[0].style.display='none';", completionHandler: nil)
        webView!.load(URLRequest(url: url!))
        webView!.evaluateJavaScript("document.getElementsByClassName('mkdf-mobile-header')[0].style.display='none';", completionHandler: nil)
        self.webView!.isHidden = true
        self.view.bringSubviewToFront(self.btnHamburger)
        self.indicator.startAnimating()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.indicator.stopAnimating()
        self.webView!.evaluateJavaScript("document.getElementsByClassName('mkdf-mobile-header')[0].style.display='none';", completionHandler: nil)
        self.webView!.isHidden = false
    }
    
    // Show side menu on menu button click
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
