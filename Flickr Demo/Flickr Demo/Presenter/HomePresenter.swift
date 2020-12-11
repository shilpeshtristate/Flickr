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
    
    func startFetchingPhotos() {
        interactor?.fetchPhotos()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller:navigationController)
    }

}

extension HomePresenter: InteractorToPresenterProtocol{
    
    func noticeFetchedSuccess(noticeModelArray: Array<HomeImagesDataModel>) {
        view?.showImages(imagesArray: noticeModelArray)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
    
}
