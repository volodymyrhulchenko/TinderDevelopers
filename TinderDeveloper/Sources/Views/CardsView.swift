//
//  CardsView.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import UIKit

internal class CardsView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.loadFromNib(nibName: "CardsView")
        
        print(DevelopersManager.shared.developers)
    }
}
