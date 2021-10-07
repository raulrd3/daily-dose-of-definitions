//
//  RandomWordViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/2/21.
//

import UIKit

class RandomWordViewController: UIViewController {
    override func loadView() {
//        view = RandomWordView()
    }
}

// Container view controller will have this view
class SearchDefinitionView: UIView {
    
    // MARK: - UI Properties
    
    // https://medium.com/nyc-design/swift-4-add-icon-to-uitextfield-48f5ebf60aa1
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Find a word..."
        textField.backgroundColor = .white
        
        let iconView = UIImageView(frame:
                          CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = UIImage(systemName: "magnifyingglass")
        
        let iconContainerView: UIView = UIView(frame:
                           CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        
        textField.leftView = iconContainerView
        textField.leftViewMode = .always
        
        return textField
//        textField.leftView =
//        textField.rightView =
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
        backgroundColor = .gray
        
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 75),
                        
        ])
    }
    
    // MARK: - Actions
    
    @objc func searchButtonPressed() {
        print("Search button pressed")
    }
}
