//
//  Double+Extensions.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 24.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
