//
//  Weather.swift
//  Weather-App
//
//  Created by Gagandeep Basra on 2016-02-04.
//  Copyright © 2016 Gagandeep Basra. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Double
    let description: String
    let icon: String
    
    var tempC: Double {
        get {
            return temp - 273.15
        }
    }
    
    init(cityName: String, temp: Double, description: String, icon: String) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
        self.icon = icon
    }
}