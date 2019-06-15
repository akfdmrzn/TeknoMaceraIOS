//
//  GamesCollectionViewCell.swift
//  TeknoMacera
//
//  Created by Akif Demirezen on 14.06.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit

class GamesCollectionViewCell: UICollectionViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)   }
    
    @IBOutlet weak var imageViewGame: UIImageView!
    @IBOutlet weak var labelGame: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setInfo(model : GameModel){
        self.labelGame.text = model.title
        self.imageViewGame.image = model.image
    }

}

class GameModel{
    var title : String = ""
    var image : UIImage = #imageLiteral(resourceName: "anasayfafly")
    var gameLink : String = ""
    
    init(t : String,i: UIImage,gameLink : String) {
        self.title = t
        self.image = i
        self.gameLink = gameLink
    }
}
