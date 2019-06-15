//
//  EtkinlikTableViewCell.swift
//  TeknoMacera
//
//  Created by Akif Demirezen on 14.06.2019.
//  Copyright © 2019 LoodosAkif. All rights reserved.
//

import UIKit

class EtkinlikTableViewCell: UITableViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)   }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    self.selectionStyle = .none
    self.containerView.layer.borderColor = UIColor.init(red: 237.0/255.0, green: 90.0/255.0, blue: 50.0/255.0, alpha: 1.0).cgColor
    self.containerView.layer.borderWidth = 1.0
    
    
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func  setInfo(model : EtkinlikModel){
        self.labelTitle.text = model.title
        self.labelDesc.text = model.desc
    }
    
}
class EtkinlikModel{
    var title : String = ""
    var desc : String = ""
    
    init(t : String,d : String) {
        self.title = t
        self.desc = d
    }
}
