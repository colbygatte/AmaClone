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
    var imageURLs: [String:Any]?
    var categories: [String:Any]?
    
    init(withJSONObject obj: JSON) {
        
        id = obj["id"].int
        title = obj["title"].string
        price = obj["price"].floatValue
        description_p = obj["description"].string
        storeId = obj["storeId"].int
        createdAt = try! obj["createdAt"].stringValue.date(format: .iso8601(options: .withInternetDateTimeExtended))
        imageURLs = obj["imageURLs"].dictionary
        categories = obj["cateogories"].dictionary
        
    }
    
}
