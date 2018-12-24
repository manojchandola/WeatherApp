//
//  WeatherDetailViewController.swift
//  DemoOpenWeather
//
//  Created by Manoj Chandola on 12/23/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    let weatherDetailViewModel = WeatherDetailViewModel()
    @IBOutlet weak var weatherDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherDetailTableView?.dataSource = weatherDetailViewModel
        weatherDetailTableView?.delegate = weatherDetailViewModel
        weatherDetailTableView.tableFooterView = UIView(frame: .zero)
    }
}

extension WeatherDetailViewModel : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "weatherDetailCell"
        let cell : WeatherDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeatherDetailTableViewCell
        cell.configureWeatherDetailCell(forecastModel: self.forecast!)
        return cell
    }
}
