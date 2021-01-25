//
//  WeatherDataSource.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 25.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "WeatherCell"
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else{
            fatalError("\(self.cellIdentifier) not found")
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.cityNameLabel.text = weatherVM.name.value
        cell.temperatureLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
        return cell
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
