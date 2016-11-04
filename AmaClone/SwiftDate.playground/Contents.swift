//: Playground - noun: a place where people can play

import UIKit
import SwiftDate

let dateS = "2016-11-03T18:56:08.050119+00:00"
let createdAt = try! dateS.date(format: .iso8601(options: .withInternetDateTimeExtended))



let jsonString = "{  \"id\": 1,  \"imageURLs\": [    {      \"id\": 1,      \"value\": \"https://media3.giphy.com/media/ttdWms7uQMpR6/200.gif\",      \"createdAt\": \"2016-11-03T18:56:08.048111+00:00\",      \"productId\": 1    }  ],  \"title\": \"One (coding) hitman for hire\",  \"price\": 5.99,  \"description\": \"Buy me tacos, I'll code your app.\",  \"categories\": [    {      \"id\": 1,      \"name\": \"Services\",      \"createdAt\": \"2016-11-03T18:56:08.049647+00:00\",      \"productId\": 1    }  ],  \"createdAt\": \"2016-11-03T18:56:08.040471+00:00\",  \"storeId\": 1}"

import SwiftyJSON
// Using SwiftyJSON:
let json = JSON(data: jsonString.data(using: .utf8)!)
json["imageURLs"][0]["value"].string // string of image url


// Not using SwiftyJSON:
let jsonObject = try! JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: []) as! [String:Any]
let imageURLs = jsonObject["imageURLs"] as! [[String:Any]]
imageURLs[0]["value"] // string of image url



// 2016-11-03T18:56:08.040471+00:00

let dateString = try! "2016-11-03T18:56:08.040471+00:00".date(format: .iso8601(options: .withInternetDateTimeExtended))

//object[1]["user"]["username"]


//: Playground - noun: a place where people can play
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
struct Product {
    var name :String
}
class AmazonCloneHTTPClient  {
    
    static var client :AmazonCloneHTTPClient!
    
    static func shared() -> AmazonCloneHTTPClient {
        
        if client == nil {
            client = AmazonCloneHTTPClient()
            
        }
        
        return client
    }
    
    var baseURL :URL!  {
        
        return URL(string: "https://still-wave-26435.herokuapp.com")
    }
    
    func getAllProducts(success :([Product]) -> (), failure :(Error) -> ()) {
        
        let url = URL(string: "/pokemon/all", relativeTo: baseURL)
        
        URLSession.shared.dataTask(with: url!) { data, _, _ in
            
            //print(data)
            
            }.resume()
        
    }
}
// calling the client
//AmazonCloneHTTPClient.shared().getAllProducts(success: { products in
//    
//    print(products)
//    
//}, failure: { error in
//    print(error)
//})


func jediGreet(name: String, ability: String) -> (farewell: String, mayTheForceBeWithYou: String) {
    return ("Good bye, \(name).", " May the \(ability) be with you.")
}

let retValue = jediGreet(name: "old friend", ability: "Force")
print(retValue.farewell)
print(retValue.mayTheForceBeWithYou)

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

let baseURL = "https://amaclone-example.now.sh/api/"
 
 
 AmaAPI(.productSearch, .get).asUrl()
 AmaAPI(.store, .get, ID: 2).asUrl()
 AmaAPI(.home, .get).asUrl()
 AmaAPI(.category, .delete, ID: 5).asUrl()
 AmaAPI(.product, .get, ID:1).asUrl()
 









