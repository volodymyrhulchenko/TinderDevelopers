//
//  CardsView.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import UIKit

internal class CardsView: UIView, DeveloperCardsDelegate {
    
    var viewModel: DeveloperCardsViewModelProtocol! {
        
        didSet {
            reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.loadFromNib(nibName: "CardsView")
    }
    
    func reloadData() {
        
        self.subviews.forEach {
            
            guard let card = $0 as? DeveloperCards
                else {
                    return
            }
            
            card.removeFromSuperview()
        }
        
        for index in 0..<min(viewModel.numberOfCards, 3) {
            
            let card = DeveloperCards()
            card.delegate = self
            let developer = viewModel.developer(at: index)
            card.developer = developer
            
            addCardView(cardView: card,
                        atIndex: index)
        }
    }
    
    func cardRemoved(developer: Developer) {
        
        viewModel.removeDeveloper(developer: developer)
    }
    
    private func addCardView(cardView: DeveloperCards,
                             atIndex index: Int) {
        setFrame(forCardView: cardView,
                 atIndex: index)
        
        self.insertSubview(cardView,
                           at: index + 1)
        
    }
    
    private func setFrame(forCardView cardView: DeveloperCards,
                          atIndex index: Int) {
        var cardViewFrame = bounds
        let koef: Int = index > 3 ? 0: index
        let inset = (CGFloat(koef) * 3)
        cardViewFrame.size.width -= 2 * inset
        cardViewFrame.origin.x += inset
        cardViewFrame.origin.y += inset
        cardView.frame = cardViewFrame
    }
}
