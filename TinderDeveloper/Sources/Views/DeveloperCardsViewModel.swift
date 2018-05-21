//
//  DeveloperCardsViewModel.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

internal final class DeveloperCardsViewModel: DeveloperCardsViewModelProtocol {
    var reloadHandler: (() -> Void)?
    
    var filter: Filter? {
        
        didSet {
            
            guard let currentFilter = filter
                else {
                    return
            }
            
            switch currentFilter {
            case .allDevelopers:
                self.developers = DevelopersManager.shared.developers
            case .custom(let value):
                
                self.developers = DevelopersManager.shared.developers.filter({
                    
                    if let lang = $0.programLang,
                        value == lang{
                        return true
                    }
                    return false
                })
            }
            
            self.reloadHandler?()
        }
    }
    
    var developers = DevelopersManager.shared.developers
    
    var numberOfCards: Int {
        return developers.count
    }
    
    func developer(at index: Int) -> Developer {
        
        return developers[index]
    }
}
