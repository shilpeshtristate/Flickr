//
//  HomeInteractor.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import Foundation

class HomeInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchPhotos() {
        
        let method = "flickr.galleries.getPhotos"
        let api_key = "d14c14722aecbb1783190a9ba52efa90"
        let gallery_id = "66911286-72157647277042064"
        
        
        var request = URLRequest(url: URL(string: "https://api.flickr.com/services/rest/?method=\(method)&api_key=\(api_key)&gallery_id=\(gallery_id)&format=json&nojsoncallback=1")!)
        request.httpMethod = "GET"
        
        
        let session = URLSession.shared.dataTask(with: request) { (data, response , error) in
            
            if let data = data {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String,Any>
                    if let dictData = dict {
                        let dictPhotos : Dictionary<String,Any> = dictData["photos"] as? Dictionary<String,Any> ?? [:]
                        let arrPhoto : Array<Dictionary<String,Any>> = dictPhotos["photo"] as? Array<Dictionary<String,Any>> ?? []
                        let arrImagesModel = arrPhoto.map({HomeImagesDataModel(dictData: $0)})
                        self.presenter?.imageFetchedSuccess(imagesModelArray: arrImagesModel)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        session.resume()
    }
}
