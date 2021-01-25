//
//  WeatherDetailsViewController.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 25.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minimunTemperatureLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weatherVM = self.weatherViewModel {
            self.cityNameLabel.text = weatherVM.name
            self.currentTemperatureLabel.text =
                weatherVM.currentTemperature.temperature.formatAsDegree
           
        }
    }
    
}


