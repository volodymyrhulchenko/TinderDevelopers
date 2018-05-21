//
//  FilterViewModel.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

internal class FilterViewModel: FilterViewModelProtocol {
    
    let filters: [Filter]
    
    init() {
        
        var filtersArray: [Filter] = [Filter.allDevelopers]
        var temp: [String] = []
        
        DevelopersManager.shared.developers.forEach {
            
            if let lang = $0.programLang,
                !temp.contains(lang) {
                
                temp.append(lang)
                filtersArray.append(Filter.custom(value: lang))
            }
        }
        
        self.filters = filtersArray
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(at section: Int) -> Int {
        
        return filters.count
    }
    
    func titleFilter(at indexPath: IndexPath) -> Filter {
        
        return filters[indexPath.row]
    }
    
    
}
