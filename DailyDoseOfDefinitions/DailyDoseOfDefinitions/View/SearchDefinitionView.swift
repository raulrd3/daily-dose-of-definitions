//
//  SearchDefinitionView.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/16/21.
//

import Foundation
import UIKit

class SearchDefinitionView: UIView {
    // MARK: - UI Properties
    
    private var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    private var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.placeholder = "Find a word..."
        textField.tintColor = .lightGray
        
        let iconView = UIImageView(frame:
                          CGRect(x: 8, y: 5, width: 20, height: 20))
        iconView.image = UIImage(named: "search")
        let iconContainerView: UIView = UIView(frame:
                          CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        textField.leftView = iconContainerView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        return button
    }()

    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpViews() {

        addSubview(dividerView)
        addSubview(searchTextField)
        addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            searchTextField.topAnchor.constraint(equalTo: dividerView.topAnchor, constant: 24),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            searchTextField.heightAnchor.constraint(equalToConstant: 44),
            
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            searchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            searchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor)
            
//            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            refreshButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//            refreshButton.widthAnchor.constraint(equalTo: refreshButton.heightAnchor)
        ])
        

    }
    
    // MARK: - Actions
    
    @objc func searchButtonPressed(){
        print("Search pressed")
    }
}
