//
//  WeatherListViewModel.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 24.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ viewModel: WeatherViewModel){
        self.weatherViewModels.append(viewModel)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
    mutating func updateUnit(to unit: Unit){
        switch unit {
        case .celcius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    mutating private func toCelcius() {
        weatherViewModels = weatherViewModels.map { viewModel in
            var weatherModel = viewModel
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    mutating private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { viewModel in
            var weatherModel = viewModel
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
}

struct WeatherViewModel: Decodable {
    
    let name: String
    var currentTemperature: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
    
}

struct TemperatureViewModel: Decodable {
    var temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
