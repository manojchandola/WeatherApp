//
//  WeatherViewModelTests.swift
//  DemoOpenWeatherTests
//
//  Created by Manoj Chandola on 12/24/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import XCTest
@testable import DemoOpenWeather

class WeatherViewModelTests: XCTestCase {

    func testParseWebserviceData() {
        let resource = Resource(method: .get, url: URL(string: API.ApiForcast)!)
        let expectation = self.expectation(description: "GET \(URL(string: API.ApiForcast)!)")
        
        NetworkManager().load(resource: resource) { jsonData, _, _ in
            let data = jsonData as! Data
            XCTAssert(data.count > 0, "server data not found")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 8) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }//Wait block end
    }

}
