//
//  FilterViewModelProtocol.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation

protocol FilterViewModelProtocol {
    
    var numberOfSections: Int { get }
    
    func numberOfRows(at section: Int) -> Int
    func titleFilter(at indexPath: IndexPath) -> Filter
}
