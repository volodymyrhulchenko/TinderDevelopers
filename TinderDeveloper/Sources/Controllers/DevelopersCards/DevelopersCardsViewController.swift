//
//  DevelopersCardsViewController.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import UIKit

internal class DevelopersCardsViewController: UIViewController {

    @IBOutlet private var cardsView: CardsView!
    override func viewDidLoad() {
        super.viewDidLoad()

        cardsView.viewModel = DeveloperCardsViewModel()
        
        title = "Developers"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "All developers",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(filter))
    }
    
    @objc
    private func filter() {
        
        
    }
}
