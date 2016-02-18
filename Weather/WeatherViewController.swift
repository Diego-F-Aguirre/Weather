//
//  MainViewController.swift
//  Weather
//
//  Created by Diego Aguirre on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var temperatureOutputLabel: UILabel!
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var cityOutputLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.backgroundColor = UIColor.dirtyWhite()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            WeatherController.weatherBySearchCity(searchText) { (result) in
                guard let weatherResult = result else { return }
                
                dispatch_async(dispatch_get_main_queue()) { () in
                    self.cityOutputLabel.text = weatherResult.cityName
                    if let temperatureC = weatherResult.temperatureC {
                        self.temperatureOutputLabel.text = String(temperatureC) + " °C"
                    } else {
                        self.temperatureOutputLabel.text = "No temperature available"
                    }
                    self.mainLabel.text = weatherResult.main
                    self.descriptionLabel.text = weatherResult.description
                }
                
//                WeatherController.weatherIconForIconCode(weatherResult.iconString, completion: { (image) -> Void in
//                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                        self.iconImageView.image = image
//                    })
//                })
            }
        }
        
        searchBar.resignFirstResponder()
    }

   
    
    
    

}
