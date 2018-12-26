//
//  WeatherTests.swift
//  DemoOpenWeather
//
//  Created by Manoj Chandola on 12/24/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import XCTest
@testable import DemoOpenWeather

class WeatherTests: XCTestCase {

    func testWeatherSetGet() {
        let weatherElement = WeatherElement(id: 123, main: "Clear", description: "Nice day", icon: "01d")
        XCTAssertEqual(weatherElement.main, "Clear")
        XCTAssertEqual(weatherElement.description, "Nice day")
        XCTAssertEqual(weatherElement.icon, "01d")
        
        let tmp = Temp(min: 10, max: 20, current: 15, pressure: 15, humidity: 10)
        XCTAssertEqual(tmp.min, 10)
        XCTAssertEqual(tmp.max, 20)
        XCTAssertEqual(tmp.current, 15)
        XCTAssertEqual(tmp.pressure, 15)
        XCTAssertEqual(tmp.humidity, 10)
        
        let wind = Wind(speed: 2, deg: 100)
        XCTAssertEqual(wind.speed, 2)
        XCTAssertEqual(wind.deg, 100)
        
        let cloud = Cloud(all: 20)
        XCTAssertEqual(cloud.all, 20)
        
        let rain = Rain(level: 8)
        XCTAssertEqual(rain.level, 8)
        
        let snow = Snow(level: 8)
        XCTAssertEqual(snow.level, 8)
        
        let forecast = Forecast(dt: 1541329200, temp: tmp, weather: [weatherElement], wind: wind, cloud: cloud, rain: rain, snow: snow, time: "2014-07-23 09:00:00")
        
        XCTAssertEqual(forecast.time, "2014-07-23 09:00:00")
    }

}
