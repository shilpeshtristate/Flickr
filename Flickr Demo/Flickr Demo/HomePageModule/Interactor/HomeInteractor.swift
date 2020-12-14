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
    
    func fetchPhotos(pageNumber: Int) {
        
        let method = "flickr.galleries.getPhotos"
        let api_key = "d14c14722aecbb1783190a9ba52efa90"
        let gallery_id = "9634-72157621980433950"//"66911286-72157647277042064"
        let page     = "\(pageNumber)"
        let per_page = "8"
        
        
        let strURL = "https://www.flickr.com/services/rest/?method=\(method)&api_key=\(api_key)&gallery_id=\(gallery_id)&per_page=\(per_page)&page=\(page)&format=json&nojsoncallback=1"
        

        var request = URLRequest(url: URL(string: strURL)!)
        request.httpMethod = "GET"
        
        
        let session = URLSession.shared.dataTask(with: request) { (data, response , error) in
            
            if let data = data {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String,Any>
                    if let dictData = dict {
                        let dictPhoto = dictData["photos"] as? Dictionary<String,Any> ?? [:]
                        let imageModel = HomeImagePhotos(dictData: dictPhoto)
                        self.presenter?.imageFetchedSuccess(imageModel: imageModel)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        session.resume()
    }
}
