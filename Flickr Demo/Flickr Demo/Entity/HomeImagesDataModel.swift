//
//  HomeImagesDataModel.swift
//  Flickr Demo
//
//  Created by Tristate Technology on 11/12/20.
//  Copyright © 2020 Tristate Technology. All rights reserved.
//

import Foundation

class HomeImagesDataModel: NSObject {
    
    var has_comment : Int    = 0
    var id          : String = ""
    var farm        : Int    = 0
    var server      : String = ""
    var is_primary  : Int    = 0
    var isfamily    : Int    = 0
    var title       : String = ""
    var owner       : String = ""
    var isfriend    : Int    = 0
    var ispublic    : Int    = 0
    var secret      : String = ""
    var imageURL    : String = ""
    
    override init() {
        super.init()
    }
    
    init(dictData : Dictionary<String,Any>) {
        print(dictData)
        has_comment = dictData["has_comment"] as? Int ?? 0
        id          = dictData["id"] as? String ?? ""
        farm        = dictData["farm"] as? Int ?? 0
        server      = dictData["server"] as? String ?? ""
        is_primary  = dictData["is_primary"] as? Int ?? 0
        isfamily    = dictData["isfamily"] as? Int ?? 0
        title       = dictData["title"] as? String ?? ""
        owner       = dictData["owner"] as? String ?? ""
        isfriend    = dictData["isfriend"] as? Int ?? 0
        ispublic    = dictData["ispublic"] as? Int ?? 0
        secret      = dictData["secret"] as? String ?? ""
        
        
//        https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
        imageURL    = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
    }
}
