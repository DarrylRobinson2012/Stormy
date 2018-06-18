//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Darryl Robinson  on 6/14/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation


enum DarkSkyError: Error {
    case requestFailed
    case responseFailed
    case invalidData
    case jsonConversionFailed
    case invalidURL
    case jsonParsingFailure
}

