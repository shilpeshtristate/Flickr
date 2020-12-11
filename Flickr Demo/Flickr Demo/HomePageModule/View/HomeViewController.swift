//
//  HomeViewController.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var cvCollection : UICollectionView!
    
    var homePresenter:HomePresenter?
    var arrImages:Array<HomeImagesDataModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Flickr Demo"
        cvCollection.register(UINib(nibName: "HomeImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeImagesCollectionViewCell")
        homePresenter?.startFetchingPhotos()
    }
}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HomeImagesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeImagesCollectionViewCell", for: indexPath) as! HomeImagesCollectionViewCell
        cell.cellConfig(model: arrImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let modelImage = arrImages[indexPath.row]
        
        if let cell = cvCollection.cellForItem(at: indexPath) as? HomeImagesCollectionViewCell, let image = cell.imgView.image {
            homePresenter?.showImageController(navigationController: navigationController ?? UINavigationController(), image: image)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.width / 3 - 10
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension HomeViewController : PresenterToViewProtocol {
    func showImages(imagesArray:Array<HomeImagesDataModel>) {
        self.arrImages = imagesArray
        DispatchQueue.main.async {
            self.cvCollection.reloadData()
        }
    }
    
    func showError() {
        
    }
}
