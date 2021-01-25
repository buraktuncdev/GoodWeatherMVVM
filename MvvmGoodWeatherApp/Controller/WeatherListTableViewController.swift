//
//  WeatherListTableViewController.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 13.08.2020.
//  Copyright © 2020 Burak Tunç. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCitySegueIdentifier" {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("Navigation Controller not found")
            }
            
            guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
                fatalError("AddWeatherCityViewController not found")
            }
            
            addWeatherCityVC.delegate = self
            
        } else if segue.identifier == "SettingsSegueIdentifier"{
            
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("Navigation Controller not found")
            }
            
            guard let settingsVC = nav.viewControllers.first as? SettingsTableViewController else {
                fatalError("SettingsSegueIdentifier not found")
            }
            
            settingsVC.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weatherViewModel = self.weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherViewModel)
        
        return cell
    }
    
}

extension WeatherListTableViewController: SettingsDelegate {
    
    //MARK: Conform the Settings delegate
    func settingsDone(viewModel: SettingsViewModel) {
        print("Settings Delegate Done")
        
        self.weatherListViewModel.updateUnit(to: viewModel.selectedUnit)
        self.tableView.reloadData()
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
    
    // MARK: Conform the AddWeatherDelegate
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        print("AddWeatherDelegate Delegate Done")
        self.weatherListViewModel.addWeatherViewModel(viewModel)
        tableView.reloadData()
    }
}
