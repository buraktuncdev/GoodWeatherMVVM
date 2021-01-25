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
    private var dataSource: GenericTableViewDataSource<WeatherCell, WeatherViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Generic Data Source Using
        self.dataSource = GenericTableViewDataSource(cellIdentifier: "WeatherCell", items: self.weatherListViewModel.weatherViewModels){ cell, viewModel in
            cell.cityNameLabel.text = viewModel.name.value
            cell.temperatureLabel.text = viewModel.currentTemperature.temperature.value.formatAsDegree
        }
        self.tableView.dataSource = self.dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        prepareForSegue(for: segue)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
        self.dataSource.updateItems(self.weatherListViewModel.weatherViewModels) // Generic Data Source Added updateItems!!
        tableView.reloadData()
    }
}

extension WeatherListTableViewController {
    func prepareForSegue(for segue: UIStoryboardSegue){
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
        } else if segue.identifier == "weatherDetailsSegueIdentifier" {
            
            guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController,
                  let indexPath = self.tableView.indexPathForSelectedRow else {
                return
            }
            
            let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
            weatherDetailsVC.weatherViewModel = weatherVM
        }
    }
}
