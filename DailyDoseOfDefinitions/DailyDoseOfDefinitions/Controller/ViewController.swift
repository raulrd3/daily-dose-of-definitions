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
                
        let randomWordViewController = RandomWordViewController()
        randomWordViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(randomWordViewController)
        contentView.randomWordContainerView.addSubview(randomWordViewController.view)
        randomWordViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            randomWordViewController.view.topAnchor.constraint(equalTo: contentView.randomWordContainerView.topAnchor),
            randomWordViewController.view.leadingAnchor.constraint(equalTo: contentView.randomWordContainerView.leadingAnchor),
            randomWordViewController.view.bottomAnchor.constraint(equalTo: contentView.randomWordContainerView.bottomAnchor),
            randomWordViewController.view.trailingAnchor.constraint(equalTo: contentView.randomWordContainerView.trailingAnchor)
        ])
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
