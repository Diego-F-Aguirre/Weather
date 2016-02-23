//
//  NetworkController.swift
//  Weather
//
//  Created by Diego Aguirre on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class NetworkController {
    
    private static let API_KEY = "4e63f48bb2d090d7fb7d80f6447ace6a"
    static let baseURL = "http://api.openweathermap.org/data/2.5/weather"
    
    static func searchURLByCity(city: String) -> NSURL {
        
        let escapedCityString = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        // http://www.example.com/api/1/weather?q=San%20Francisco&appid=abc1234
        let urlString = baseURL + "?q=\(escapedCityString!)" + "&appid=\(API_KEY)"
        return NSURL(string: urlString)!
    }
    
    static func dataAtURL(url: NSURL, completion: (resultData: NSData?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data: NSData? , response: NSURLResponse?, error: NSError?) -> Void in
            
            if let error = error {
                print(error.localizedDescription)
                completion(resultData: nil)
                return
            }
            
            completion(resultData: data)
        }
        
        dataTask.resume()
    }
}

//let boston = NetworkController.searchURLByCity("Boston")
//
//NetworkController.fetchDataAtURL(boston) { data in
//    if let data = data {
//        // request was successful and I have data
//    }
//}

//func fetchData(url: NSURL, completion: (NSData?, NSURLResponse?, NSError?) -> Void) {
//    NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: completion).resume()
//}
//
//fetchData(NSURL(string: "http://example.com")!) { _ in
//    print("Hello World")
//}
//
//NSURL // represents a web URL
//NSURLRequest // represents a full request to a URL
//NSURLSessionDataTask // represents a single request and response to a URL
//NSURLSession // represents a network connection
