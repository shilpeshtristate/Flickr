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
    var model : HomeImagePhotos = HomeImagePhotos()
    
    var page_no = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Flickr Demo"
        cvCollection.register(UINib(nibName: "HomeImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeImagesCollectionViewCell")
        homePresenter?.startFetchingPhotos(pageNumber: page_no)
    }
}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.arrPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HomeImagesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeImagesCollectionViewCell", for: indexPath) as! HomeImagesCollectionViewCell
        cell.cellConfig(model: model.arrPhotos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = cvCollection.cellForItem(at: indexPath) as? HomeImagesCollectionViewCell, let image = cell.imgView.image {
            homePresenter?.showImageController(navigationController: navigationController ?? UINavigationController(), image: image)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 2 - 10
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

extension HomeViewController : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let y = Int(scrollView.contentOffset.y + scrollView.frame.size.height)
        let height = Int(scrollView.contentSize.height)
        if y >= height {
            if model.arrPhotos.count < model.total{
                self.page_no += 1
                homePresenter?.startFetchingPhotos(pageNumber: self.page_no)
            }
        }
    }
}


extension HomeViewController : PresenterToViewProtocol {
    func showImages(imageModel: HomeImagePhotos) {
        
        var arrImages = model.arrPhotos
        arrImages += imageModel.arrPhotos
        model = imageModel
        model.arrPhotos = arrImages
        
        DispatchQueue.main.async {
            self.cvCollection.collectionViewLayout.invalidateLayout()
            self.cvCollection.reloadData()
        }
    }
    
    func showError() {
        
    }
}
