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
        
        setupVMBindings()
    }
    
    private func setupVMBindings(){
        
        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind { self.cityNameLabel.text = $0 }
            weatherVM.currentTemperature.temperature.bind { self.currentTemperatureLabel.text = $0.formatAsDegree }
        }
        
        // change the value after few seconds -> View Model to View Binding!!
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.weatherViewModel?.name.value = "Boston"
        }
    }
    
}


