//
//  Product.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/3/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftDate


class Product {
    var id: Int!
    var title: String!
    var price: Float!
    var description_p: String!
    var storeId: Int!
    var createdAt: DateInRegion!
    var imageURLs: [[String:Any]]!
    var categories: [String:Any]?
    
    init(withJSONObject obj: JSON) {
        
        id = obj["id"].int
        title = obj["title"].string
        price = obj["price"].floatValue
        description_p = obj["description"].string
        storeId = obj["storeId"].int
        createdAt = try! obj["createdAt"].stringValue.date(format: .iso8601(options: .withInternetDateTimeExtended))
        
        // FIXME
        // this will probably break if there are no imagesURLs
        imageURLs = []
        for imageURL in obj["imageURLs"].array! {
            var obj: [String: Any] = [:]
            for (key, val) in imageURL {
                obj[key] = val
            }
            
            // FIXME need to conver date string to date object
            //obj["value"] = URL(string: obj["value"].string )
            //self.imageURLs.append(obj)
        }
        
        categories = obj["cateogories"].dictionary
        
    }
    
    func makeJSONString() -> String {
        return ""
    }
    
}
