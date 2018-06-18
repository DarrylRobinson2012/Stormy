//
//  Coordinate.swift
//  Stormy
//
//  Created by Darryl Robinson  on 6/17/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension  Coordinate: CustomStringConvertible {
    var description: String{
        return "\(latitude),\(longitude)"
    }
}
