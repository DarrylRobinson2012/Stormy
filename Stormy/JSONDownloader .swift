//
//  JSONDownloader .swift
//  Stormy
//
//  Created by Darryl Robinson  on 6/14/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation


class JSONDownloader {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    convenience init() {
        self.init(configuration: .default)
    }
    typealias  JSON = [String: AnyObject]
    
    typealias JSONTaskCompletionHandler = (JSON?, DarkSkyError?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            
        
    
        
                // Converts to HTTP Response
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(nil, .requestFailed)
            return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                        completion(json, nil)
                    } catch {
                         completion(nil, .jsonConversionFailed)
                    }
                    } else {
                        completion(nil, .invalidData)
                    }
                    }else {
                    completion(nil, .responseFailed)
                }
            }
            
            
        
    return task
    }
    
}
