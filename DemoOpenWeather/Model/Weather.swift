//
//  Weather.swift
//  DemoOpenWeather
//
//  Created by Manoj Chandola on 12/22/18.
//  Copyright © 2018 Manoj. All rights reserved.
//

import Foundation

struct Weather: Codable, Equatable {
    let cod: String
    let message: Double
    let cnt: Int
    let forecasts: [Forecast]
    let city: City
    
    private enum CodingKeys : String, CodingKey {
        case cod, message, cnt, forecasts = "list", city
    }
}

struct City: Codable, Equatable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    
    private enum CodingKeys : String, CodingKey {
        case id, name, coord, country
    }
}

struct Coord: Codable, Equatable {
    let lon, lat: Double

    private enum CodingKeys : String, CodingKey {
        case lon, lat
    }
}

struct Forecast: Codable, Equatable {
    let dt: Int
    let temp: Temp
    let weather: [WeatherElement]
    let wind: Wind
    let cloud: Cloud?
    let rain: Rain?
    let snow: Snow?
    let time: String
    
    
    private enum CodingKeys : String, CodingKey {
        case dt, temp = "main", weather, wind, cloud = "clouds", rain, snow, time = "dt_txt"
    }
    
    func commentOnTempo() -> String{
        if(self.temp.max > 25){
            return "it's hot"
        }
        if(self.temp.min < 10){
            return "it's cold"
        }
        return ""
    }
}

struct Temp: Codable, Equatable {
    let min, max: Double
    let current: Double
    let pressure: Double
    let humidity: Int
    
    private enum CodingKeys : String, CodingKey {
        case min = "temp_min", max = "temp_max", current = "temp", pressure, humidity
    }
}

struct Wind: Codable, Equatable {
    let speed, deg: Double
    
    private enum CodingKeys : String, CodingKey {
        case speed, deg
    }
}

struct Cloud: Codable, Equatable {
    let all: Int?
    
    private enum CodingKeys : String, CodingKey {
        case all
    }
}

struct Rain: Codable, Equatable {
    let level: Double?
    
    private enum CodingKeys : String, CodingKey {
        case level = "3h"
    }
}

struct Snow: Codable, Equatable {
    let level: Double?
    
    private enum CodingKeys : String, CodingKey {
        case level = "3h"
    }
}

struct WeatherElement: Codable, Equatable {
    let id: Int
    let main: String
    let description, icon: String
    
    private enum CodingKeys : String, CodingKey {
        case id, main, description, icon
    }
}

// MARK: Convenience initializers and mutators
extension Weather {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Weather.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        cod: String? = nil,
        message: Double? = nil,
        cnt: Int? = nil,
        forecasts: [Forecast]? = nil,
        city: City? = nil
        ) -> Weather {
        return Weather(
            cod: cod ?? self.cod,
            message: message ?? self.message,
            cnt: cnt ?? self.cnt,
            forecasts: forecasts ?? self.forecasts,
            city: city ?? self.city
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension City {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(City.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int? = nil,
        name: String? = nil,
        coord: Coord? = nil,
        country: String? = nil,
        population: Int? = nil
        ) -> City {
        return City(
            id: id ?? self.id,
            name: name ?? self.name,
            coord: coord ?? self.coord,
            country: country ?? self.country
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Coord {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Coord.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        lon: Double? = nil,
        lat: Double? = nil
        ) -> Coord {
        return Coord(
            lon: lon ?? self.lon,
            lat: lat ?? self.lat
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Forecast {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Forecast.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        dt: Int? = nil,
        temp: Temp? = nil,
        weather: [WeatherElement]? = nil,
        wind: Wind? = nil,
        cloud: Cloud? = nil,
        rain: Rain? = nil,
        snow: Snow? = nil,
        time: String? = nil
        ) -> Forecast {
        return Forecast(
            dt: dt ?? self.dt,
            temp: temp ?? self.temp,
            weather: weather ?? self.weather,
            wind: wind ?? self.wind,
            cloud: cloud ?? self.cloud,
            rain: rain ?? self.rain,
            snow: snow ?? self.snow,
            time: time ?? self.time
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Temp {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Temp.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        min: Double? = nil,
        max: Double? = nil,
        current: Double? = nil,
        pressure: Double? = nil,
        humidity: Int? = nil
        ) -> Temp {
        return Temp(
            min: min ?? self.min,
            max: max ?? self.max,
            current: current ?? self.current,
            pressure: pressure ?? self.pressure,
            humidity: humidity ?? self.humidity
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Wind {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Wind.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        speed: Double? = nil,
        deg: Double? = nil
        ) -> Wind {
        return Wind(
            speed: speed ?? self.speed,
            deg: deg ?? self.deg
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Cloud {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Cloud.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        all: Int? = nil
        ) -> Cloud {
        return Cloud(
            all: all ?? self.all
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Rain {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Rain.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        level: Double? = nil
        ) -> Rain {
        return Rain(
            level: level ?? self.level
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Snow {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Snow.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        level: Double? = nil
        ) -> Snow {
        return Snow(
            level: level ?? self.level
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension WeatherElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeatherElement.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int? = nil,
        main: String? = nil,
        description: String? = nil,
        icon: String? = nil
        ) -> WeatherElement {
        return WeatherElement(
            id: id ?? self.id,
            main: main ?? self.main,
            description: description ?? self.description,
            icon: icon ?? self.icon
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
