//
//  DefinitionTableViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/20/21.
//

import Foundation

import UIKit

class DefinitionTableViewController: UIViewController {
    
    
    //MARK: - Class Properties
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!

    
    //MARK: - Lifecyle
    
    override func loadView() {
        super.loadView()
//        view.backgroundColor = .yellow
        safeArea = view.layoutMarginsGuide
        
        setupTableView()
      }
    
    func setupTableView() {
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set row height (leaving empty for automatic sizing)
        //register cells
        //set contraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.backgroundColor = .black
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: DefinitionTableViewCell.identifier)
      }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension DefinitionTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return DefinitionTableViewCell()
    }
    
    
}





