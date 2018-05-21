//
//  Filter.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

enum Filter {
    
    case allDevelopers
    case custom(value: String)
    
    var stringValue: String {
        
        switch self {
        case .allDevelopers:
            
            return "All Developers"
        case .custom(let value):
            return value
        }
    }
}
