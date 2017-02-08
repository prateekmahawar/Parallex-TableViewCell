//
//  ImageCellTableVCTableViewCell.swift
//  Parallex
//
//  Created by Prateek Mahawar on 08/02/17.
//  Copyright © 2017 Prateek Mahawar. All rights reserved.
//

import UIKit

class ImageCellTableVC: UITableViewCell {
    @IBOutlet weak var imagePic: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var imagePicHeight: NSLayoutConstraint!
    @IBOutlet weak var parallexTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        imagePic.clipsToBounds = true
        
    }

    func configureCell(text:String, Imag: UIImage) {
        self.imagePic.image = Imag
        self.textLbl.text = text
    }
    
    
}
