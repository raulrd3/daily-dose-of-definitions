//
//  MainView.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/1/21.
//

import UIKit

class MainView: UIView {
    
    // MARK: - UI Properties
    
    let headerView: HeaderView = {
        let headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
            
    // TODO: Will be a ContainerView
    let randomWordView: RandomWordView = {
        let view = RandomWordView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.refreshButton.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        view.layer.cornerRadius = 30
        return view
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let definitionSearchContainerView: SearchDefinitionView = {
        let searchDefinitionView = SearchDefinitionView()
        searchDefinitionView.translatesAutoresizingMaskIntoConstraints = false
        return searchDefinitionView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup Methods
    
    private func setUpViews() {
        addSubview(headerView)
        addSubview(randomWordView)
        addSubview(dividerView)
        addSubview(definitionSearchContainerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerView.bottomAnchor.constraint(equalTo: randomWordView.topAnchor, constant: -8),
            
            randomWordView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            randomWordView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            randomWordView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            randomWordView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20),
            
            dividerView.topAnchor.constraint(equalTo: randomWordView.bottomAnchor, constant: 10),
            dividerView.leadingAnchor.constraint(equalTo: randomWordView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: randomWordView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            definitionSearchContainerView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10),
            definitionSearchContainerView.leadingAnchor.constraint(equalTo: dividerView.leadingAnchor),
            definitionSearchContainerView.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor),
            definitionSearchContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: Actions
    
    @objc func refreshButtonPressed() {
        
        print("Refresh pressed")
    }
}
