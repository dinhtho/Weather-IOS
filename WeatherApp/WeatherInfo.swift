//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by LAP15789 on 12/05/2023.
//

import Foundation


struct WeatherInfo: Codable {
    let id = UUID()
    var dt:Int64?
    var temp: Temperature?
    var weather: [Weather]?
    
    private enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case weather
    }
}

struct Temperature: Codable{
    var max:Float
}

struct Weather: Codable{
    var main:String
}


struct WeatherInfoResponse: Codable {
    var cnt: Int?
    var list: [WeatherInfo]?
    
}
