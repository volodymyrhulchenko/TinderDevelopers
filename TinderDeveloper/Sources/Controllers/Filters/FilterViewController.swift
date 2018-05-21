//
//  FilterViewController.swift
//  TinderDeveloper
//
//  Created by Vladimir Hulchenko on 5/21/18.
//  Copyright © 2018 Vladimir Hulchenko. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,
UITableViewDataSource,
UITableViewDelegate{
    
    let viewModel: FilterViewModelProtocol
    var filterHandler: (Filter) -> Void
    
    init(handler: @escaping (Filter) -> Void) {
        
        self.filterHandler = handler
        self.viewModel = FilterViewModel()
        super.init(nibName: "FilterViewController",
                   bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(close))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
    }
    
    @objc private func close() {
        
        navigationController?.dismiss(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = viewModel.titleFilter(at: indexPath).stringValue
        cell.textLabel?.textColor = UIColor.darkGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath,
                              animated: true)
        
        self.filterHandler(viewModel.titleFilter(at: indexPath))
        self.navigationController?.dismiss(animated: true)
    }
}
