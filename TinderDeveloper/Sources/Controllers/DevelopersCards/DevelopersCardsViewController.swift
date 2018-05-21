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
        
        title = "Developers"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "All developers",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(filter))
        
        cardsView.viewModel = DeveloperCardsViewModel()
        cardsView.viewModel.reloadHandler = {
            
            self.cardsView.reloadData()
        }
    }
    
    @objc
    private func filter() {
        
        let navController = UINavigationController(rootViewController: FilterViewController(handler: { (filter) in
            
            self.cardsView.viewModel.filter = filter
            
            self.navigationItem.rightBarButtonItem?.title = filter.stringValue
        }))
        
        self.present(navController,
                     animated: true)
    }
}
