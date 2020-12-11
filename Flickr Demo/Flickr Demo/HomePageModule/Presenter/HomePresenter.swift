//
//  HomePresenter.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingPhotos(pageNumber: Int) {
        interactor?.fetchPhotos(pageNumber: pageNumber)
    }
    
    func showImageController(navigationController: UINavigationController,image: UIImage) {
        router?.pushToImageScreen(navigationConroller:navigationController, image: image)
    }

}

extension HomePresenter: InteractorToPresenterProtocol{
    
    func imageFetchedSuccess(imageModel: HomeImagePhotos) {
        view?.showImages(imageModel: imageModel)
    }
    
    func imageFetchFailed() {
        view?.showError()
    }
    
    
}
