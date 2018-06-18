//
//  DarkSkyApiClient .swift
//  Stormy
//
//  Created by Darryl Robinson  on 6/17/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let ApiKey =  "57432e44f621ddce2fd55de3778b9570"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.ApiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias  CurrentWeatherCompletionHandler = ( CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidURL)
            return
        }
        let request = URLRequest(url: url)

        let task = downloader.jsonTask(with: request) { json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                    
                }
                
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                
                completion(currentWeather, nil)
            }
                
            }
            
         
        task.resume()
}
}
