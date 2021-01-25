//
//  CustomCell.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 24.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ weatherViewModel: WeatherViewModel){
        self.cityNameLabel?.text = weatherViewModel.name
        self.temperatureLabel?.text = (weatherViewModel.currentTemperature.temperature.formatAsDegree)
    }
    
}
