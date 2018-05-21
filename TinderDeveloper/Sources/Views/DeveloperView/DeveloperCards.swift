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
    
    init() {
        super.init(frame: CGRect())
        loadFromNib(nibName: "DeveloperCards")
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self,
                                                       action: #selector(DeveloperCards.gestureRecognizer(_:)))
        addGestureRecognizer(gestureRecognizer)
        
        self.subviews.first?.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 2
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.loadFromNib(nibName: "DeveloperCards")
    }
    
    @objc private func gestureRecognizer(_ gestureRecognizer: UIPanGestureRecognizer) {
        let panGestureTranslation = gestureRecognizer.translation(in: self)
        
        switch gestureRecognizer.state {
            
        case .changed:
            let rotationStrength = panGestureTranslation.x / frame.width
            let rotationAngle = CGFloat(Double.pi) / 20 * rotationStrength
            
            var transform = CATransform3DIdentity
            transform = CATransform3DRotate(transform, rotationAngle, 0, 0, 1)
            transform = CATransform3DTranslate(transform, panGestureTranslation.x, panGestureTranslation.y, 0)
            layer.transform = transform
        case .ended:
            
            if panGestureTranslation.x < -self.frame.width / 2 || (panGestureTranslation.x > self.frame.width / 2) {
                
                UIView.animate(withDuration: 1,
                               animations: {
                                
                                self.layer.frame.origin.x = panGestureTranslation.x < -self.frame.width / 2 ? -self.frame.width: self.frame.width
                                
                },
                               completion: { (_) in
                                self.removeFromSuperview()
                })
                
            } else {
                
                UIView.animate(withDuration: 1) {
                    
                    var transform = CATransform3DIdentity
                    transform = CATransform3DRotate(transform, 0, 0, 0, 1)
                    transform = CATransform3DTranslate(transform, 0, 0, 0)
                    self.layer.transform = transform
                    self.layer.shouldRasterize = false
                }
            }
        default:
            break
        }
    }
}
