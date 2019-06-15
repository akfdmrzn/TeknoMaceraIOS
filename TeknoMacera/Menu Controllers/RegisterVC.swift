
import UIKit
import InteractiveSideMenu
import WebKit
import Lottie
import MessageUI

/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class RegisterVC: UIViewController, SideMenuItemContent, Storyboardable,MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var lottieView: AnimationView!
    @IBOutlet weak var txtFieldAd: UITextField!
    @IBOutlet weak var txtFieldEposta: UITextField!
    @IBOutlet weak var txtFieldKonu: UITextField!
    @IBOutlet weak var txtFieldDate: UITextField!
    var webView : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.indicator.isHidden = true
        
        self.txtFieldAd.attributedPlaceholder = NSAttributedString(string:"Adınız Soyadınız", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        self.txtFieldEposta.attributedPlaceholder = NSAttributedString(string:"EPosta Adresiniz", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        self.txtFieldKonu.attributedPlaceholder = NSAttributedString(string:"Konu", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        self.txtFieldDate.attributedPlaceholder = NSAttributedString(string:"Doğum Tarihiniz", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        
    }
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["you@yoursite.com"])
            mail.setMessageBody("Ad:\(self.txtFieldAd.text)<br>Eposta:\(self.txtFieldEposta.text)<br>Konu:\(self.txtFieldKonu.text)<br>Doğum Tarihi:\(self.txtFieldDate.text)<br>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    @IBAction func btnRegister(_ sender: Any) {
        
        self.sendEmail()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    // Show side menu on menu button click
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
