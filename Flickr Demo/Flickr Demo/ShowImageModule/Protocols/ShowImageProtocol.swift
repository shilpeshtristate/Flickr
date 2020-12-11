//
//  ShowImageProtocol.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import Foundation
import UIKit

protocol ImageViewToPresenterProtocol: class{
    
    var view: ImagePresenterToViewProtocol? {get set}
    var interactor: ImagePresenterToInteractorProtocol? {get set}
    var router: ImagePresenterToRouterProtocol? {get set}
    func showImageController(navigationController:UINavigationController)

}

protocol ImagePresenterToViewProtocol: class{
    
}

protocol ImagePresenterToRouterProtocol: class {
    static func createImageModule()-> ShowImageViewController
}

protocol ImagePresenterToInteractorProtocol: class {
    var presenter:ImageInteractorToPresenterProtocol? {get set}
}

protocol ImageInteractorToPresenterProtocol: class {
    
}
