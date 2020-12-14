//
//  HomeViewRouter.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import Foundation
import UIKit

class HomeViewRouter:PresenterToRouterProtocol{
    static func createHomeModule() -> HomeViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router:PresenterToRouterProtocol = HomeViewRouter()
        
        view.homePresenter = presenter as? HomePresenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToImageScreen(navigationConroller navigationController:UINavigationController , image: UIImage) {
        let showImageModule = ShowImageRouter.createImageModule()
        showImageModule.image = image
        navigationController.pushViewController(showImageModule,animated: true)
    }
    
}
