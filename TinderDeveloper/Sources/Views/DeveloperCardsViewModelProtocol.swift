//
//  DeveloperCardsViewModelProtocol.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

protocol DeveloperCardsViewModelProtocol: class {
    
    var numberOfCards: Int { get }
    
    func developer(at index: Int) -> Developer
}
