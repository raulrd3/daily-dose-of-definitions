//
//  MainView.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/11/21.
//

import Foundation
import UIKit

class MainView: UIView {
    
    // MARK: UI Properties
    
    let headerView: HeaderView = {
        let headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    let randomWordView: RandomWordView = {
        let randomWordView = RandomWordView()
        randomWordView.translatesAutoresizingMaskIntoConstraints = false
        return randomWordView
    }()
    
    let searchDefinitionView: SearchDefinitionView = {
        let searchDefinitionView = SearchDefinitionView()
        searchDefinitionView.translatesAutoresizingMaskIntoConstraints = false
        return searchDefinitionView
    }()
    
    
    
    // MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup Views
    
    private func setUpViews(){
        
        addSubview(headerView)
        addSubview(randomWordView)
        addSubview(searchDefinitionView)
       
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            randomWordView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            randomWordView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            randomWordView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            randomWordView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20),
            
            searchDefinitionView.topAnchor.constraint(equalTo: randomWordView.bottomAnchor, constant: 24),
            searchDefinitionView.leadingAnchor.constraint(equalTo: randomWordView.leadingAnchor),
            searchDefinitionView.trailingAnchor.constraint(equalTo: randomWordView.trailingAnchor),
//            searchDefinitionView.bottomAnchor.constraint(equalTo: searchDefinitionView.bottomAnchor, constant: 10.0),
            
            
            
            
        ])
    }
    
    
}
