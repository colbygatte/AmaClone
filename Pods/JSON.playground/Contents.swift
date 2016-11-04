//: Playground - noun: a place where people can play

import UIKit

import SwiftyJSON



/*
{
    "id": 1,
    "imageURLs": [
        {
            "id": 1,
            "value": "https://media3.giphy.com/media/ttdWms7uQMpR6/200.gif",
            "createdAt": "2016-11-03T18:56:08.048111+00:00",
            "productId": 1
        }
    ],
    "title": "One (coding) hitman for hire",
    "price": 5.99,
    "description": "Buy me tacos, I'll code your app.",
    "categories": [
        {
            "id": 1,
            "name": "Services",
            "createdAt": "2016-11-03T18:56:08.049647+00:00",
            "productId": 1
        }
    ],
    "createdAt": "2016-11-03T18:56:08.040471+00:00",
    "storeId": 1
}
*/

let jsonString = "{  \"id\": 1,  \"imageURLs\": [    {      \"id\": 1,      \"value\": \"https://media3.giphy.com/media/ttdWms7uQMpR6/200.gif\",      \"createdAt\": \"2016-11-03T18:56:08.048111+00:00\",      \"productId\": 1    }  ],  \"title\": \"One (coding) hitman for hire\",  \"price\": 5.99,  \"description\": \"Buy me tacos, I'll code your app.\",  \"categories\": [    {      \"id\": 1,      \"name\": \"Services\",      \"createdAt\": \"2016-11-03T18:56:08.049647+00:00\",      \"productId\": 1    }  ],  \"createdAt\": \"2016-11-03T18:56:08.040471+00:00\",  \"storeId\": 1}"



let json = JSON(data: jsonString.data(using: .utf8)!)

json["imageURLs"][0]["value"]


