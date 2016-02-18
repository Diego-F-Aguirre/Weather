//
//  Weather.swift
//  Weather
//
//  Created by Diego Aguirre on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Weather {
    
    static let kWeatherKey = "weather"
    static let kMainKey = "main"
    static let kDescriptionKey = "description"
    static let kIconKey = "icon"
    static let kTemperatureKey = "temp"
    static let kNameKey = "name"
    
    var main: String = ""
    var description: String = ""
    var temperatureK: Float?
    var cityName: String = ""
    var temperatureC: Float? {
        get {
            if let temperatureK = temperatureK {
                return temperatureK - 273.15
            } else {
                return nil
            }
        }
    }
    
    init(jsonDictionary: [String: AnyObject]) {
        
        if let arrayUsingWeatherKey = jsonDictionary[Weather.kWeatherKey] as? [[String : AnyObject]] {
            if let main = arrayUsingWeatherKey[0][Weather.kMainKey] as? String {
                self.main = main
            }
            if let description = arrayUsingWeatherKey[0][Weather.kDescriptionKey] as? String {
                self.description = description
            }
        }
        
        if let main = jsonDictionary[Weather.kMainKey] as? [String : AnyObject] {
            if let temperature = main[Weather.kTemperatureKey] as? NSNumber {
                self.temperatureK = Float(temperature)
            }
        }
        
        if let cityName = jsonDictionary[Weather.kNameKey] as? String {
            self.cityName = cityName
        }
        
    }
    
}