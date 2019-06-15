//
//  kesfetCollectionViewCell.swift
//  TeknoMacera
//
//  Created by Akif Demirezen on 14.06.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit




class kesfetCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)   }
    
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.labelTitle.layer.shadowColor = UIColor.black.cgColor;
        self.labelTitle.layer.shadowOpacity = 0.7;
        self.labelTitle.layer.shadowRadius  = 2;
        self.labelTitle.layer.shadowOffset  = CGSize(width :0, height :2)
        self.labelTitle.layer.masksToBounds = false;
    }
    func setInfo(model : KesfetModel){
        self.labelTitle.text = model.title
        self.downloadImage(from: URL.init(string: model.imageLink)!)
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.imageViewLogo.image = UIImage(data: data)
            }
        }
    }
}
