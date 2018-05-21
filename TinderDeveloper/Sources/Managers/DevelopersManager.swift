//
//  DevelopersManager.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

internal final class DevelopersManager {
    
    static let shared = DevelopersManager()
    
    var developers: [Developer] = []
    
    private init() {
        
        if let path = Bundle.main.path(forResource: "DevelopersList", ofType: "plist"),
            let developersPlist = NSArray(contentsOfFile: path) as? [[String: String]] {
            
            developersPlist.forEach {
                developers.append(Developer(object: $0))
            }
        }
    }
}
