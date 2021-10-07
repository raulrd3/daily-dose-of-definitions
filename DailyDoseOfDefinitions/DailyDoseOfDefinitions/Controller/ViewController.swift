//
//  ViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/1/21.
//

import UIKit

class ViewController: UIViewController {

    var contentView = MainView()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.definitionSearchContainerView.tableView.delegate = self
        contentView.definitionSearchContainerView.tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DefinitionTableViewCell.identifier, for: indexPath) as? DefinitionTableViewCell else {
            assertionFailure("Expected to dequeue \(DefinitionTableViewCell.self)")
            return UITableViewCell()
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
