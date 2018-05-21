//
//  DeveloperCardsViewModelProtocol.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

protocol DeveloperCardsViewModelProtocol: class {
    
    var filter: Filter? { get set }
    
    var numberOfCards: Int { get }
    var reloadHandler: (() -> Void)? { get set }
    
    func developer(at index: Int) -> Developer
    func removeDeveloper(developer: Developer)
}
