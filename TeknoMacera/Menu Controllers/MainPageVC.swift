//
//  MainPageViewController.swift
//  TeknoMacera
//
//  Created by LoodosAkif on 16.05.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import CircleMenu

class MainPageVC: UIViewController,SideMenuItemContent, Storyboardable {
    
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var btnHamburger: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var titles : [String] = []
    var imageCategories : [UIImage] = []
    var items : [(icon: String, color: UIColor)] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.titles = ["Oyun Oyna","İzle Öğren","Etkinlik","Asel'e Sor"]
        self.imageCategories = [#imageLiteral(resourceName: "electronic"),#imageLiteral(resourceName: "bigcamera"),#imageLiteral(resourceName: "bigparty"),#imageLiteral(resourceName: "bigask")]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MainPageCellTableViewCell.nib, forCellReuseIdentifier: MainPageCellTableViewCell.identifier)
        self.items = [
            ("iconjigsaw", UIColor(red: 0.96, green: 0.23, blue: 0.21, alpha: 1)),
            ("iconaudio", UIColor(red: 0.19, green: 0.57, blue: 1, alpha: 1)),
            ("iconparty", UIColor(red: 0.22, green: 0.74, blue: 0, alpha: 1))
            
        ]
        let button = CircleMenu(
            frame: CGRect(x: self.view.frame.size.width / 2.0 - 30, y: self.view.frame.size.height - 92, width: 60, height: 60),
            normalIcon:"iconmenu",
            selectedIcon:"iconcancel",
            buttonsCount: 3,
            duration: 0.3,
            distance: 100)
        button.backgroundColor = UIColor.black
        button.delegate = self
        button.layer.cornerRadius = button.frame.size.width / 2.0
        self.view.addSubview(button)
        
    }
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
extension MainPageVC : UITableViewDelegate,UITableViewDataSource,CircleMenuDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:MainPageCellTableViewCell.identifier, for: indexPath as IndexPath) as? MainPageCellTableViewCell{
            
            cell.labelTitle.text = self.titles[indexPath.section]
            cell.imageCategory.image = self.imageCategories[indexPath.section]
            cell.contentView.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 10.0
            if indexPath.section == 0{
                cell.backgroundImageview?.backgroundColor = UIColor.white
            }
            else if indexPath.section == 1{
                cell.backgroundImageview?.backgroundColor = UIColor.white
            }
            else if indexPath.section == 2{
                cell.backgroundImageview?.backgroundColor = UIColor.white
            }
            else if indexPath.section == 3{
                cell.backgroundImageview?.backgroundColor = UIColor.white
            }
            
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "PlayGameVC", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PlayGameVC") as! PlayGameVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        else if indexPath.section == 1 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "WatchLearnVC", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WatchLearnVC") as! WatchLearnVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        else if indexPath.section == 2 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "EtkinlikVC", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EtkinlikVC") as! EtkinlikVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        else if indexPath.section == 3 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "AskAselsanVC", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AskAselsanVC") as! AskAselsanVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0 // whatever you want space between two cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
        if atIndex == 0 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "PlayGameVC", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PlayGameVC") as! PlayGameVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        else if atIndex == 1 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "WatchLearnVC", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WatchLearnVC") as! WatchLearnVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        else if atIndex == 2 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "EtkinlikVC", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EtkinlikVC") as! EtkinlikVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
    }
}
