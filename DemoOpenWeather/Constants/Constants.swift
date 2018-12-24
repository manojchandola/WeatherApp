//
//  Constants.swift
//  DemoOpenWeather
//
//  Created by Manoj Chandola on 12/22/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import Foundation

//Sample URl  https://samples.openweathermap.org/data/2.5/forecast?q=London,us&appid=b6907d289e10d714a6e88b30761fae22
struct API {
    static let ApiBase = "https://api.openweathermap.org/data/2.5/"
    static let AppId = "648a3aac37935e5b45e09727df728ac2"
    static let ApiForcast = API.ApiBase + "forecast?q=London,us&appid=" + API.AppId
    static let ApiImageURL = "https://openweathermap.org/img/w/"
}

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}
