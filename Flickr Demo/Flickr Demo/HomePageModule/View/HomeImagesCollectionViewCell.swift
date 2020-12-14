//
//  HomeImagesCollectionViewCell.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import UIKit
import SDWebImage

class HomeImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func cellConfig(model : HomeImagesDataModel) {
        imgView.sd_setImage(with: URL(string: model.imageURL), placeholderImage: nil)
    }
}
