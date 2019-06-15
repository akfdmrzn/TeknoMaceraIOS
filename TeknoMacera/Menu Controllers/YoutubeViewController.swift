//
//  YoutubeViewController.swift
//  TeknoMacera
//
//  Created by Akif Demirezen on 14.06.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit

class YoutubeViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    var url : String = "" 
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.indicator.stopAnimating()
        self.webview.loadRequest(URLRequest.init(url: URL.init(string: self.url)!))
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    override var shouldAutorotate: Bool {
        return true
    }
    override func viewWillDisappear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    @IBAction func btnKapatAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
