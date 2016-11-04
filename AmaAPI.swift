//
//  AmaAPI.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/3/16.
//  Copyright © 2016 colbyg. All rights reserved.
//
import Foundation

struct AmaAPI {
    static let apiURL = "https://amaclone-example.now.sh/api/"
    
    enum HTTPMethod {
        case post, get, put, delete
    }
    
    enum on {
        case category, product, productSearch, store, home
    }
    
    var ID: Int?
    var httpMethod: HTTPMethod
    var on: on
    
    init(_ on: on, _ method: HTTPMethod, ID: Int) {
        self.httpMethod = method
        self.ID = ID
        self.on = on
    }
    
    init(_ on: on, _ method: HTTPMethod) {
        self.httpMethod = method
        self.on = on
    }
    
    func asString() -> String? {
        
        switch self.on {
        case .category, .product, .store:
            if ID == nil {
                switch httpMethod {
                case .get, .post:
                    return "\(AmaAPI.apiURL)\(self.on)/"
                default:
                    return nil
                }
            } else {
                switch httpMethod {
                case .delete, .get, .put:
                    return "\(AmaAPI.apiURL)\(self.on)/\(ID!)"
                default:
                    return nil
                }
            }
        case .home:
            return "\(AmaAPI.apiURL)"
        case .productSearch:
            return "\(AmaAPI.apiURL)\(on.product)/search"
            
        }
        
    }
    
    func asUrl() -> URL? {
        let string = asString()
        if string == nil {
            return nil
        } else {
            let url = URL(string: string!)
            return url
        }
    }
    
}

/*
 Examples
 
 AmaAPI(.productSearch, .get).asUrl()
 AmaAPI(.store, .get, ID: 2).asUrl()
 AmaAPI(.home, .get).asUrl()
 AmaAPI(.category, .delete, ID: 5).asUrl()
 
*/
