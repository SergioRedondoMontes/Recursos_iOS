//
//  WeatherData.swift
//  example_alamo_json_clima
//
//  Created by Sergio Redondo on 11/05/2020.
//  Copyright © 2020 NBTech. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
