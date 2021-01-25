//
//  AddWeatherDelegate.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 24.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation

protocol AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}
