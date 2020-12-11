//
//  HomeViewProtocol.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingPhotos()
    func showImageController(navigationController:UINavigationController,image:UIImage)

}

protocol PresenterToViewProtocol: class{
    func showImages(imagesArray:Array<HomeImagesDataModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createHomeModule()-> HomeViewController
    func pushToImageScreen(navigationConroller:UINavigationController,image: UIImage)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchPhotos()
}

protocol InteractorToPresenterProtocol: class {
    func imageFetchedSuccess(imagesModelArray:Array<HomeImagesDataModel>)
    func imageFetchFailed()
}
