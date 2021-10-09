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
    
    let randomWordContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let definitionSearchContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(randomWordContainerView)
        addSubview(dividerView)
        addSubview(definitionSearchContainerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerView.bottomAnchor.constraint(equalTo: randomWordContainerView.topAnchor, constant: -8),
            
            randomWordContainerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            randomWordContainerView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            randomWordContainerView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            randomWordContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20),
            
            dividerView.topAnchor.constraint(equalTo: randomWordContainerView.bottomAnchor, constant: 10),
            dividerView.leadingAnchor.constraint(equalTo: randomWordContainerView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: randomWordContainerView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            definitionSearchContainerView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10),
            definitionSearchContainerView.leadingAnchor.constraint(equalTo: dividerView.leadingAnchor),
            definitionSearchContainerView.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor),
            definitionSearchContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
