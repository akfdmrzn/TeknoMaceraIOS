//
//  MainPageCellTableViewCell.swift
//  TeknoMacera
//
//  Created by LoodosAkif on 16.05.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit

class MainPageCellTableViewCell: UITableViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)   }
    
    @IBOutlet weak var backgroundImageview: UIView!
    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = SelectionStyle.none
    }
    override func layoutSubviews() {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
