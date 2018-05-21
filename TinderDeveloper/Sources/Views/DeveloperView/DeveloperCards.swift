//
//  DeveloperCards.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import UIKit

class DeveloperCards: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var developer: Developer? {
        
        didSet {
            
            guard let currentDeveloper = developer else {
                return
            }
            
            nameLabel.text = currentDeveloper.name
            langLabel.text = currentDeveloper.programLang
            genderLabel.text = currentDeveloper.gender.rawValue
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
