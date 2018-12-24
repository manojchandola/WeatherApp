//
//  WeatherViewModel.swift
//  DemoOpenWeather
//
//  Created by Manoj Chandola on 12/22/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import UIKit

protocol WeatherViewModelProtocol {
    func didReceiveWeatherData()
    func pushToNextViewWithIndex(indexPath: IndexPath)
}

class WeatherViewModel: NSObject {
    var delegate: WeatherViewModelProtocol?
    var weather : Weather?
    
    func parseWebserviceData() {
        if isInternetAvailable() {
            let resource = Resource(method: .get, url: URL(string: API.ApiForcast)!)
            NetworkManager().load(resource: resource) { jsonData, _, _ in
                guard let jsonData = jsonData else { return }
                do {
                    self.weather = try Weather(data: jsonData as! Data)
                    print("Weather Details ## \(String(describing: self.weather))")
                    self.delegate?.didReceiveWeatherData()
                }
                catch let DecodingError.dataCorrupted(context) { // catch each Decodable error separately
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            }
        }
    }
}
