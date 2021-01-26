//
//  SettingsViewModelTest.swift
//  MvvmGoodWeatherAppTests
//
//  Created by Burak Tunc on 26.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import XCTest
@testable import MvvmGoodWeatherApp

class SettingsViewModelTest: XCTestCase {

    private var settingsViewModel: SettingsViewModel!
    
    override  func setUp() {
        super.setUp()
        self.settingsViewModel = SettingsViewModel()
    }
    
    func testShouldMakeSureThatDefaultSelectedUnitIsFahrenheit(){
        XCTAssertEqual(settingsViewModel.selectedUnit, .fahrenheit)
    }
    
//    func testShouldReturnCorrectDisplayNameForCelcius(){
//        XCTAssertEqual(self.settingsViewModel.selectedUnit.displayName, "Celcius")
//    }
//
//    func testShouldReturnCorrectDisplayNameForFahrenheit(){
//        XCTAssertNotEqual(self.settingsViewModel.selectedUnit.displayName, "Fahrenheit")
//    }
    
    func testShouldBeAbleToSaveUserUnitSelection(){
        self.settingsViewModel.selectedUnit = .celcius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }

}
