//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Darryl Robinson  on 6/14/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

struct  CurrentWeather {
    let temperature: Double
    let humidity: Double
    let precipitationProbability: Double
    let summary: String
    let icon: String

}

extension CurrentWeather {
    struct key {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipitationProabaility = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    

    init?(json: [String: AnyObject]){
        guard let tempValue = json[key.temperature] as? Double,
        let humidityValue = json[key.humidity] as? Double,
        let precipitationProbabilityValue = json[key.precipitationProabaility] as? Double,
        let summaryString = json[key.summary] as? String,
        let iconString = json[key.icon] as? String
         else { return nil}
        
        self.temperature = tempValue
        self.humidity = humidityValue
        self.precipitationProbability = precipitationProbabilityValue
        self.summary = summaryString
        self.icon = iconString
    
        
    }
}
