//
//  ShowImageViewController.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {
    
    @IBOutlet weak var imgView : UIImageView!
    
    var presenter : ShowImagePresenter?
    var image : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        if image != nil {
            imgView.image = image!
        }
    }
}
