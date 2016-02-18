//
//  AppearanceController.swift
//  Weather
//
//  Created by Diego Aguirre on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializeAppearanceDefaults() {
        
        
        UINavigationBar.appearance().barTintColor = UIColor.darkGrey()
        UITextField.appearance().backgroundColor = UIColor.darkPurple()
        UITextField.appearance().textColor = UIColor.dirtyWhite()

        
    }
}