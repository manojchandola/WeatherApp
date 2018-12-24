//
//  ViewController.swift
//  DemoOpenWeather
//
//  Created by Manoj Chandola on 12/22/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherViewModelProtocol{

    let viewModel = WeatherViewModel()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewModel.delegate = self
        viewModel.parseWebserviceData()
        listTableView?.dataSource = viewModel
        listTableView?.delegate = viewModel
    }
    
    //Mark: WeatherViewModelProtocol
    func didReceiveWeatherData() {
        DispatchQueue.main.async {
            self.title = self.viewModel.weather?.city.name
            self.listTableView.reloadData()
        }
    }
    
    func pushToNextViewWithIndex(indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WeatherDetailViewController") as? WeatherDetailViewController
        vc?.weatherDetailViewModel.forecast = (viewModel.weather?.forecasts[indexPath.row])!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension WeatherViewModel : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRow = self.weather?.forecasts.count {
            return numberOfRow
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "listCell"
        let cell : ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ListTableViewCell
        let forecastObj : Forecast = (self.weather?.forecasts[indexPath.row])!
        cell.configureFeatureCell(forecastModel: forecastObj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.pushToNextViewWithIndex(indexPath: indexPath)
    }
}


