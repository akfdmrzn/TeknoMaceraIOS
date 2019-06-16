//
//  MainPageViewController.swift
//  TeknoMacera
//
//  Created by LoodosAkif on 16.05.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class MainPageVC: UIViewController,SideMenuItemContent, Storyboardable {
    
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var titles : [String] = []
    var imageCategories : [UIImage] = []
    var items : [(icon: String, color: UIColor)] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.titles = ["Oyun Oyna","İzle Öğren","Etkinlik","Asel'e Sor"]
        self.imageCategories = [#imageLiteral(resourceName: "anasyfa1"),UIImage.init(named: "satranc")!,UIImage.init(named: "note")!,UIImage.init(named: "fuze")!]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MainPageCellTableViewCell.nib, forCellReuseIdentifier: MainPageCellTableViewCell.identifier)
        
    }
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
   
}
extension MainPageVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:MainPageCellTableViewCell.identifier, for: indexPath as IndexPath) as? MainPageCellTableViewCell{
            
            cell.labelTitle.text = self.titles[indexPath.section]
            cell.imageCategory.image = self.imageCategories[indexPath.section]
            cell.contentView.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 10.0
            if indexPath.section == 0{
                cell.labelTitle.text = ""
                cell.labelDesc.text = "Tekno Macera ücretsiz bir dijital eğitim platformu olarak, siz çocuklar için ASELSAN tarafından hazırlandı"
            }
            else if indexPath.section == 1{
                cell.labelTitle.text = "Kendini Geliştir"
                cell.labelDesc.text = "Animasyon eğitim videolarını izleyerek merak ettiklerini öğrenebilirsin"
            }
            else if indexPath.section == 2{
                cell.labelTitle.text = "Hayallerini Tasarla"
                cell.labelDesc.text = "Kendi fikirlerini ortaya çıkarıp, nasıl uygulayacağını öğrenebilirsin"
            }
            else if indexPath.section == 3{
                cell.labelTitle.text = "Eğlenceli Vakit Geçir"
                cell.labelDesc.text = "Kodlama dünyasını oyun oynayarak öğren, eğlenirken yeni bilgiler keşfet"
                
            }
            
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15.0 // whatever you want space between two cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
}
