
import UIKit
import InteractiveSideMenu
import WebKit
import Lottie

/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class WatchLearnVC: UIViewController, SideMenuItemContent, Storyboardable {
    
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lottieView: AnimationView!
    var webView : WKWebView?
    
    var gameList : [WatchLearnModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.indicator.isHidden = true
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(WatchLearnCollectionViewCell.nib, forCellWithReuseIdentifier: WatchLearnCollectionViewCell.identifier)
        
        self.gameList.append(WatchLearnModel.init(t: "ASELSAN Tekno Macera Tanıtım Filmi", i: UIImage.init(named: "Wath1")!, videoLink: "https://www.youtube.com/watch?v=HIQVxJvb7UU"))
        self.gameList.append(WatchLearnModel.init(t: "ASEL Cevaplıyor - 1. Bölüm: Bilgisayar Mühendisi Olarak Neler Yapabilirim?", i: UIImage.init(named: "watch2")!, videoLink: "https://www.youtube.com/watch?v=pk8FBBz-JLg&feature=youtu.be"))
        self.gameList.append(WatchLearnModel.init(t: "ASEL Cevaplıyor - 2. Bölüm: Gezegenler Nasıl Oluşur?", i: UIImage.init(named: "watch3")!, videoLink: "https://www.youtube.com/watch?v=CtkMyXV-JyE&feature=youtu.be"))
        self.gameList.append(WatchLearnModel.init(t: "ASEL Cevaplıyor - 3. Bölüm: Uydular Nasıl Çalışır?", i: UIImage.init(named: "watch4")!, videoLink: "https://www.youtube.com/watch?v=tyLS-WToM2M"))
        self.gameList.append(WatchLearnModel.init(t: "ASEL Cevaplıyor - 4. Bölüm: Neden Kod Yazmayı Öğrenmeliyim?", i: UIImage.init(named: "watch5")!, videoLink: "https://www.youtube.com/watch?v=SadHXamfSss"))


        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    // Show side menu on menu button click
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
extension WatchLearnVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:WatchLearnCollectionViewCell
            .identifier, for: indexPath as IndexPath) as? WatchLearnCollectionViewCell
        
        cell?.setInfo(model: self.gameList[indexPath.row])
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "YoutubeLessonVC", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "YoutubeLessonVC") as! YoutubeLEssonViewController
        nextViewController.url = self.gameList[indexPath.row].videoLink
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.size.width * 0.4, height: 240.0)
    }
    
}
