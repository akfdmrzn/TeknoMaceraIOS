
import UIKit
import InteractiveSideMenu
import WebKit
import Lottie

/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class EtkinlikVC: UIViewController, SideMenuItemContent, Storyboardable{
    
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lottieView: AnimationView!
    var webView : WKWebView?
    
    var etkinlikList : [EtkinlikModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.indicator.isHidden = true
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(EtkinlikTableViewCell.nib, forCellReuseIdentifier: EtkinlikTableViewCell.identifier)
        
        self.etkinlikList.append(EtkinlikModel.init(t: "24 Nisan ASELSAN Tekno Macera Lansman ve Canlı Yayın", d: "ASELSAN Tekno Macera Lansman ve Canlı Yayını 24 Nisan YouTube, Facebook ve Twitter Tekno Macera sosyal medya hesaplarında canlı yayında sizlerle buluşuyor."))
        
        self.etkinlikList.append(EtkinlikModel.init(t: "27 Nisan Armada AVM - Robot ve Teknoloji Atölyesi", d: "27 Nisan Cumartesi saat 14.00. -18.00 arasında Armada AVM’de gerçekleşecek olan Robot ve Teknoloji Atölyesinde ASEL, Eda ve Mete tüm çocuk dostları ile buluşuyor. Tekno Macera etkinliklerine katıl, atölye çalışmaları ve sürpriz hediyeleri kaçırma!"))
        
        self.etkinlikList.append(EtkinlikModel.init(t: "28 Nisan Armada AVM - Robot ve Teknoloji Atölyesi", d: "28 Nisan Pazar saat 14.00. -18.00 arasında Armada AVM’de gerçekleşecek olan Robot ve Teknoloji Atölyesinde ASEL, Eda ve Mete tüm çocuk dostları ile buluşuyor. Tekno Macera etkinliklerine katıl, atölye çalışmaları ve sürpriz hediyeleri kaçırma!"))
        
        
        self.etkinlikList.append(EtkinlikModel.init(t: "12 Mayıs Cepa AVM - Robot ve Teknoloji Atölyesi", d: "12 Mayıs saat 14.00 – 17.00 arasında Cepa AVM’de gerçekleşecek olan Robot ve Teknoloji Atölyesinde ASEL, Eda ve Mete tüm çocuk dostları ile buluşuyor. Tekno Macera etkinliklerine katıl, atölye çalışmaları ve sürpriz hediyeleri kaçırma!"))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    // Show side menu on menu button click
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
extension EtkinlikVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:EtkinlikTableViewCell.identifier, for: indexPath as IndexPath) as? EtkinlikTableViewCell{
            
            cell.setInfo(model: self.etkinlikList[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0 // whatever you want space between two cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
}
