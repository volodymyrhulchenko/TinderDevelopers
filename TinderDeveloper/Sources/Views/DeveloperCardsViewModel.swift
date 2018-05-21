//
//  DeveloperCardsViewModel.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

internal final class DeveloperCardsViewModel: DeveloperCardsViewModelProtocol {
    
    var developers = DevelopersManager.shared.developers
    
    var numberOfCards: Int {
        return developers.count
    }
    
    func developer(at index: Int) -> Developer {
        
        return developers[index]
    }
}
