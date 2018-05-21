//
//  UIView+Xib.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func loadFromNib(nibName: String) {
        guard let xibView = Bundle.main.loadNibNamed(nibName,
                                                     owner: self,
                                                     options: nil)?.first as? UIView
            else { return }
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
    }
}
