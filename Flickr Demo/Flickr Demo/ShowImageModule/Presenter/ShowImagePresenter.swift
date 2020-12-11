//
//  ShowImagePresenter.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import Foundation
import UIKit

class ShowImagePresenter : ImageViewToPresenterProtocol {
    var view: ImagePresenterToViewProtocol?
    
    var interactor: ImagePresenterToInteractorProtocol?
    
    var router: ImagePresenterToRouterProtocol?
    
    func startFetchingPhotos() {
        
    }
    
    func showImageController(navigationController: UINavigationController) {
        
    }
}

extension ShowImagePresenter: ImageInteractorToPresenterProtocol{
    
}
