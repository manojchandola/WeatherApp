//
//  WeatherDetailTableViewCell.swift
//  DemoOpenWeather
//
//  Created by Manoj Chandola on 12/23/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import UIKit

class WeatherDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWeatherDetailCell(forecastModel : Forecast) {
        let strUrl =  URL(string: API.ApiImageURL + (forecastModel.weather[0].icon) + ".png")
        let data = try? Data(contentsOf: strUrl!)
        self.weatherImage?.image = UIImage(data: data!)
        self.weatherLabel.text = forecastModel.weather[0].main
        self.weatherDesc.text = forecastModel.weather[0].description
        
        self.tempMinLabel?.text = "\(forecastModel.temp.min)º"
        self.tempMaxLabel?.text = "\(forecastModel.temp.max)º"
        self.pressureLabel.text = "\(lround((forecastModel.temp.pressure))) hPa"
        self.humidityLabel.text = "\(forecastModel.temp.humidity) %"
        
        self.windSpeedLabel.text = "\(lround((forecastModel.wind.speed))) m/s"
        self.directionLabel.text = "\(lround((forecastModel.wind.deg)))º"
        
        self.dateTimeLabel.text = forecastModel.time
    }
}
