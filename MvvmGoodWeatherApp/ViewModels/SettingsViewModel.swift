//
//  SettingsViewModel.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 24.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
            case .celcius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get{
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }
        
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.setValue(newValue.rawValue, forKey: "unit")
        }
        
    }
}
