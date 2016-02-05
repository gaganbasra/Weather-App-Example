//
//  WeatherService.swift
//  Weather-App
//
//  Created by Gagandeep Basra on 2016-02-04.
//  Copyright © 2016 Gagandeep Basra. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=Montreal,canada&appid=12415144e91b624da0f65a79f9c1c196"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            let json = JSON(data: data!)
            print(json)
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            let name = json["name"].string
            let desc = json["weather"][0]["description"].string
            
            let weather = Weather(cityName: name!, temp: temp!, description: desc!)
            
            if self.delegate != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.setWeather(weather)
                })
            }
            
            print("Lat:\(lat!) lon:\(lon!) temp:\(temp!)")
        }
        
        task.resume()

//        print("Weather forcast for: \(city)")
//        
//        let weather = Weather(cityName: city, temp: 237.12, description: "A nice Day")
//        
//        if delegate != nil {
//            delegate?.setWeather(weather)
//        }
    }
}
