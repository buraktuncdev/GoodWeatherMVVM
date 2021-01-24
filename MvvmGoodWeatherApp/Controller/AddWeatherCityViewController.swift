//
//  AddWeatherCityViewController.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 13.08.2020.
//  Copyright © 2020 Burak Tunç. All rights reserved.
//

import Foundation
import UIKit


class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveButtonPressed(){
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=c2986ebdaa70141b1081463ede8bbe58")!
            
            let weatherResource = Resource<Any>(url: weatherURL) { data in
                return data
            }
            
            Webservice().load(resource: weatherResource) { result in
                print(result)
            }
        }
    }
    
    @IBAction func closeButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
