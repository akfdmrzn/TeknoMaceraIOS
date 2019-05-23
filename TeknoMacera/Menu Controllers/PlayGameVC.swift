
import UIKit
import InteractiveSideMenu
import WebKit
import Lottie

/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class PlayGameVC: UIViewController, SideMenuItemContent, Storyboardable,WKNavigationDelegate,WKUIDelegate {
    
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var lottieView: AnimationView!
    var webView : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.indicator.isHidden = true
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.viewContainer.addSubview(self.webView!)
        self.webView!.navigationDelegate = self;
        self.webView!.uiDelegate = self;
        let url = URL(string: "https://www.teknomacera.com/oyun-oyna/")
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
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.indicator.stopAnimating()
        self.lottieView.isHidden = true;  self.webView!.evaluateJavaScript("document.getElementsByClassName('mkdf-mobile-header')[0].style.display='none';", completionHandler: nil)
        self.webView!.isHidden = false
    }
    
    // Show side menu on menu button click
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
