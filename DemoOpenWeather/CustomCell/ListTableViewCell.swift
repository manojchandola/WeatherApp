//
//  ListTableViewCell.swift
//  DemoOpenWeather
//
//  Created by Manoj Chandola on 12/23/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureFeatureCell(forecastModel : Forecast) {
        self.textLabel?.text = updateDate(timestamp: Double(forecastModel.dt))
        self.detailTextLabel?.text = "\(lround((forecastModel.temp.current)))"
        let strUrl =  URL(string: API.ApiImageURL + (forecastModel.weather[0].icon) + ".png")
        let data = try? Data(contentsOf: strUrl!)
        self.imageView?.image = UIImage(data: data!)
    }
    
    func updateDate(timestamp : Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "EEEE (dd MMM yyyy)" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}
