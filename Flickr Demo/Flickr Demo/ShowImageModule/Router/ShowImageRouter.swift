//
//  ShowImageRouter.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import Foundation
import UIKit

class ShowImageRouter:ImagePresenterToRouterProtocol{
    static func createImageModule() -> ShowImageViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ShowImageViewController") as! ShowImageViewController
        
        let presenter: ImageViewToPresenterProtocol & ImageInteractorToPresenterProtocol = ShowImagePresenter()
        let interactor: ImagePresenterToInteractorProtocol = ShowImageInteractor()
        let router:ImagePresenterToRouterProtocol = ShowImageRouter()
        
        view.presenter = presenter as? ShowImagePresenter
        presenter.view = view as? ImagePresenterToViewProtocol
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
