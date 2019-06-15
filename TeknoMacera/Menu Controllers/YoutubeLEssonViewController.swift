//
//  YoutubeLEssonViewController.swift
//  TeknoMacera
//
//  Created by Akif Demirezen on 15.06.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit
import WebKit

class YoutubeLEssonViewController: UIViewController,WKUIDelegate,WKNavigationDelegate {
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var url : String = ""
    var webView : WKWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.viewContainer.frame.size.width, height: self.viewContainer.frame.size.height))
        
        self.indicator.startAnimating()
        self.viewContainer.addSubview(self.webView!)
        self.webView!.navigationDelegate = self;
        self.webView!.uiDelegate = self;
        let url = URL(string: self.url)
        if Reachability.isConnectedToNetwork(){
            webView!.load(URLRequest(url: url!));
            self.webView?.backgroundColor = UIColor.init(red: 37.0/255.0, green: 38.0/255.0, blue: 146.0/255.0, alpha: 1.0)
            self.webView!.isHidden = true
            self.setNeedsStatusBarAppearanceUpdate()
        }else{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen İnternet Bağlantınızı Kontrol Edin.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webView!.isHidden = false
        self.indicator.stopAnimating()
    }
    
    @IBAction func btnDissmissPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

