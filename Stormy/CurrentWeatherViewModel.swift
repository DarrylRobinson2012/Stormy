//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Darryl Robinson  on 6/14/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit


struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    
    
    init(model: CurrentWeather) {
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentValue)%"
        let precipPercentValue = Int(model.precipitationProbability * 100)
        self.precipitationProbability = "100%"
        
        self.summary = model.summary
        
        let weatherIcon = WeatherIcon(iconString: model.icon)
        self.icon = weatherIcon.image
    }
    
}

