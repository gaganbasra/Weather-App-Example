//
//  ViewController.swift
//  Weather-App
//
//  Created by Gagandeep Basra on 2016-02-02.
//  Copyright © 2016 Gagandeep Basra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    let weatherService = WeatherService()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBAction func setCityTapped(sender: AnyObject) {
        openCityAlert()
    }
    
    func openCityAlert() {
        
        //Create Alert
        let alert = UIAlertController(title: "City",
            message: "Enter City Name",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        //Create Cancel Action
        let cancel = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alert.addAction(cancel)
        
        //Create OK Action
        let ok = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
                let textField = alert.textFields? [0]
                let cityName = textField?.text
                self.cityLabel.text = cityName
                self.weatherService.getWeather(cityName!)
        }
        
        alert.addAction(ok)
        
        //add text field
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "City Name"
        }
        
        //Present Alert Controller
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func setWeather(weather: Weather) {
        print("** Set Weather **")
        print("City:\(weather.cityName) temp:\(weather.temp) desc:\(weather.description)")
        cityLabel.text = weather.cityName
        tempLabel.text = "\(weather.temp)"
        descLabel.text = weather.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

