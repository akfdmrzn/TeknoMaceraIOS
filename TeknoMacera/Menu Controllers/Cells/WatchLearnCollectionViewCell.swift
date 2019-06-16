//
//  WatchLearnCollectionViewCell.swift
//  TeknoMacera
//
//  Created by Akif Demirezen on 15.06.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit

class WatchLearnCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)   }
    
    
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setInfo(model : WatchLearnModel){
        self.labelTitle.text = model.title
        self.imageViewLogo.image = model.image
    }
}

class WatchLearnModel{
    var title : String = ""
    var image : UIImage = #imageLiteral(resourceName: "anasayfafly")
    var videoLink : String = ""
    
    init(t : String,i: UIImage,videoLink : String) {
        self.title = t
        self.image = i
        self.videoLink = videoLink
    }
}

