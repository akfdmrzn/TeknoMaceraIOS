

import UIKit
import InteractiveSideMenu
import WebKit
import Lottie
import SWXMLHash


/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class KesfetVC: UIViewController, SideMenuItemContent, Storyboardable {
    
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionViewKesfet: UICollectionView!
    
    @IBOutlet weak var lottieView: AnimationView!
    var webView : WKWebView?
    
    var RSSLink = "https://teknomacera.com/rss"
    var xmlString = ""
    
    var kesfetList : [KesfetModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.indicator.isHidden = false
        self.indicator.startAnimating()
        self.collectionViewKesfet.delegate = self
        self.collectionViewKesfet.dataSource = self
        self.collectionViewKesfet.register(kesfetCollectionViewCell.nib, forCellWithReuseIdentifier: kesfetCollectionViewCell.identifier)
        
        self.getXMLDataFromServer()
        
        
    }
    func getXMLDataFromServer(){
        let url = NSURL(string: RSSLink)
        
        //Creating data task
        let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if data == nil {
                print("dataTaskWithRequest error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            let parser = XMLParser(data: data!)
            let xml = SWXMLHash.parse(data!)
            for element in xml["rss"]["channel"]["item"].all{
                let title = element["title"].element!.text
                
                var imgSrc = element.description.components(separatedBy: "src=")
                var  tempImg = imgSrc[1].components(separatedBy: " ")
                let imgStr = tempImg[0].dropFirst(1).dropLast(1)
                
                var tempLink = imgSrc[1].components(separatedBy:"<link>")
                let link = tempLink[1].components(separatedBy:"</link>")[0]
                
                let kModel = KesfetModel.init(t: title, l: link, img: String(imgStr))
                self.kesfetList.append(kModel)
                
            }
            self.indicator.isHidden = true
            self.indicator.stopAnimating()
            self.collectionViewKesfet.reloadData()
            
        }
        
        task.resume()
        
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
extension KesfetVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.kesfetList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewKesfet.dequeueReusableCell(withReuseIdentifier:kesfetCollectionViewCell.identifier, for: indexPath as IndexPath) as? kesfetCollectionViewCell
            cell?.setInfo(model: self.kesfetList[indexPath.row])
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "YoutubeLessonVC", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "YoutubeLessonVC") as! YoutubeLEssonViewController
        nextViewController.url = self.kesfetList[indexPath.row].link
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 150.0, height: 210.0)
    }
    
}
class KesfetModel{
    var title : String = ""
    var link : String = ""
    var imageLink : String = ""
    
    init(t : String,l: String,img : String) {
        self.title = t
        self.link = l
        self.imageLink = img
    }
}
