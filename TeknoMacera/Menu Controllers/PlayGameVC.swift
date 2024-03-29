
import UIKit
import InteractiveSideMenu
import WebKit
import Lottie

/**
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class PlayGameVC: UIViewController, SideMenuItemContent, Storyboardable{
    
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionViewGames: UICollectionView!
    @IBOutlet weak var lottieView: AnimationView!
    
    var gameList : [GameModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.indicator.isHidden = true
        
        
        self.collectionViewGames.delegate = self
        self.collectionViewGames.dataSource = self
        self.collectionViewGames.register(GamesCollectionViewCell.nib, forCellWithReuseIdentifier: GamesCollectionViewCell.identifier)
        self.gameList.append(GameModel.init(t: "Asel'le Kodlama", i: UIImage.init(named: "oyun1")!, gameLink: "https://teknomacera.com/aselle-kodlama/aselle-kodlama/maze/index.html"))
        self.gameList.append(GameModel.init(t: "Uzay Macerası", i: UIImage.init(named: "oyun2")!, gameLink: "https://teknomacera.com/uzay-macerasi/"))
        self.gameList.append(GameModel.init(t: "Tekno Bilgi", i: UIImage.init(named: "oyun3")!, gameLink: "https://teknomacera.com/aselsan-tekno-bilgi/index.html"))
        self.gameList.append(GameModel.init(t: "Asel'le Hafıza Oyunu", i: UIImage.init(named: "oyun4")!, gameLink: "https://teknomacera.com/aselsan-hafiza/index.html"))
        self.collectionViewGames.reloadData()
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        self.alert(message: "Lütfen Telefonunuzu Yatay Biçime Getiriniz")
    }
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    override var shouldAutorotate: Bool{
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.landscape
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    // Show side menu on menu button click
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
extension PlayGameVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewGames.dequeueReusableCell(withReuseIdentifier:GamesCollectionViewCell.identifier, for: indexPath as IndexPath) as? GamesCollectionViewCell
        cell?.setInfo(model: self.gameList[indexPath.row])
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "YoutubeVC", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "YoutubeViewController") as! YoutubeViewController
        nextViewController.url = self.gameList[indexPath.row].gameLink
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 150.0, height: 210.0)
    }
    
}
