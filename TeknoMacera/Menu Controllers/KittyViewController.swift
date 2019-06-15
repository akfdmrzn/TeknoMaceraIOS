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
import Lottie
import CircleMenu


/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class KittyViewController: UIViewController, SideMenuItemContent, Storyboardable,WKNavigationDelegate,WKUIDelegate,CircleMenuDelegate {

    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var lottieView: AnimationView!
    var webView : WKWebView?
    var items : [(icon: String, color: UIColor)] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = [
            ("iconjigsaw", UIColor(red: 0.96, green: 0.23, blue: 0.21, alpha: 1)),
            ("iconaudio", UIColor(red: 0.19, green: 0.57, blue: 1, alpha: 1)),
            ("iconparty", UIColor(red: 0.22, green: 0.74, blue: 0, alpha: 1))
            
        ]
        let button = CircleMenu(
            frame: CGRect(x: self.viewBottom.frame.size.width / 2.0 - 60, y: 80, width: 60, height: 60),
            normalIcon:"iconmenu",
            selectedIcon:"iconcancel",
            buttonsCount: 3,
            duration: 1,
            distance: 100)
        button.backgroundColor = UIColor.black
        button.delegate = self
        button.layer.cornerRadius = button.frame.size.width / 2.0
        self.viewBottom.addSubview(button)
        
        self.indicator.isHidden = true
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.viewContainer.addSubview(self.webView!)
        self.webView!.navigationDelegate = self;
        self.webView!.uiDelegate = self;
        let url = URL(string: "https://www.teknomacera.com/");
        webView!.evaluateJavaScript("document.getElementsByClassName('mkdf-mobile-header')[0].style.display='none';", completionHandler: nil)
        if Reachability.isConnectedToNetwork(){
            webView!.load(URLRequest(url: url!));
            webView!.evaluateJavaScript("document.getElementsByClassName('mkdf-mobile-header')[0].style.display='none';", completionHandler: nil)
            self.webView?.backgroundColor = UIColor.init(red: 37.0/255.0, green: 38.0/255.0, blue: 146.0/255.0, alpha: 1.0)
            self.webView!.isHidden = true
            self.view.bringSubviewToFront(self.btnHamburger)
            self.indicator.startAnimating()
            self.setNeedsStatusBarAppearanceUpdate()
        }else{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen İnternet Bağlantınızı Kontrol Edin.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }

        /// Some time later
        let starAnimation = Animation.named("robot")
        lottieView.animation = starAnimation
        self.lottieView.play { (finished) in
            /// Animation finished
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.indicator.stopAnimating()
        self.lottieView.isHidden = true;        self.webView!.evaluateJavaScript("document.getElementsByClassName('mkdf-mobile-header')[0].style.display='none';", completionHandler: nil)
        self.webView!.isHidden = false
    }
    
    // Show side menu on menu button click
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
        if atIndex == 0 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "PlayGameVC", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PlayGameVC") as! PlayGameVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        else if atIndex == 1 {
            
        }
        else if atIndex == 2 {
            
        }
        
    }
}

extension UIColor {
    static func color(_ red: Int, green: Int, blue: Int, alpha: Float) -> UIColor {
        return UIColor(
            red: 1.0 / 255.0 * CGFloat(red),
            green: 1.0 / 255.0 * CGFloat(green),
            blue: 1.0 / 255.0 * CGFloat(blue),
            alpha: CGFloat(alpha))
    }
}
