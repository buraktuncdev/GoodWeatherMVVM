//
//  WeatherListViewModelTest.swift
//  MvvmGoodWeatherAppTests
//
//  Created by Burak Tunc on 26.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import XCTest
@testable import MvvmGoodWeatherApp

class WeatherListViewModelTest: XCTestCase {
    
    private var weatherListViewModel: WeatherListViewModel!
    private var weatherViewModel: WeatherViewModel!
    
    override func setUp() {
        super.setUp()
        self.weatherListViewModel = WeatherListViewModel()
        self.weatherListViewModel.addWeatherViewModel(getWeatherViewModelFromLocal())
    }
    
//    func testShouldBeAbleToConvertToCelciusSuccessfuly(){
//        let celciusTemperature = 22.2222
//        self.weatherListViewModel.updateUnit(to: .celcius)
//
//        print(weatherListViewModel.modelAt(0).currentTemperature.temperature.value)
//        XCTAssertEqual(weatherListViewModel.modelAt(0).currentTemperature.temperature.value, celciusTemperature)
//
//    }
    
    
    func testSearchResponse() throws {
        
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "result", ofType: "json") else {
            fatalError("result.json not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        
        print("The JSON string is: \(jsonString)")
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert result.json to Data")
        }
        
//        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any] else {
//            fatalError("Unable to convert UnitTestData.json to JSON dictionary")
//        }
//
//        print("The JSON dictionary is: \(jsonDictionary)")
        
        let response = try JSONDecoder().decode(WeatherViewModel.self, from: jsonData)
        
        print(response)
        
        XCTAssertNotNil(response)
        
    }
    
    func getWeatherViewModelFromLocal() -> WeatherViewModel {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "result", ofType: "json") else {
            fatalError("result.json not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
    
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert result.json to Data")
        }
        
        let response = try! JSONDecoder().decode(WeatherViewModel.self, from: jsonData)
        
        return response
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
}
