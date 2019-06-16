
import UIKit
import InteractiveSideMenu
import WebKit
import Lottie
import MessageUI

/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class AskAselsanVC: UIViewController,SideMenuItemContent, Storyboardable,WKUIDelegate,MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var txtFieldEposta: UITextField!
    @IBOutlet weak var txtFieldtKonu: UITextField!
    @IBOutlet weak var txtFieldSoru: UITextField!
    
    @IBOutlet weak var lottieView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtFieldName.attributedPlaceholder = NSAttributedString(string:"Adınız Soyadınız", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        self.txtFieldEposta.attributedPlaceholder = NSAttributedString(string:"E-Posta Adresiniz", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        self.txtFieldtKonu.attributedPlaceholder = NSAttributedString(string:"Konu", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        self.txtFieldSoru.attributedPlaceholder = NSAttributedString(string:"Asele Sor", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        
        self.indicator.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["akifde1907@gmail.com"])
            mail.setMessageBody("Ad:\(self.txtFieldName.text)<br>Eposta:\(self.txtFieldEposta.text)<br>Konu:\(self.txtFieldtKonu.text)<br>Soru:\(self.txtFieldSoru.text)<br>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @IBAction func btnAskAsel(_ sender: Any) {
    }
    // Show side menu on menu button click
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
