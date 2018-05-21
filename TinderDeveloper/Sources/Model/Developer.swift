//
//  Developer.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

internal final class Developer {
    
    enum Gender: String {
        
        case male
        case female
    }
    
    var name: String?
    var programLang: String?
    var gender: Gender
    
    init(object: [String: String]) {
        
        self.name = object["name"]
        self.programLang = object["lang"]
        
        if object["gender"]?.lowercased() == "m" {
            
            gender = Gender.male
        } else {
            
            gender = Gender.female
        }
    }
}
