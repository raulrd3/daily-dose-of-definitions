//
//  MainView.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/1/21.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Properties
    
    let headerView: HeaderView = {
        let headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
            
    let randomWordView: RandomWordView = {
        let view = RandomWordView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.refreshButton.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
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
    
//    let definitionSearchContainerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .gray
//        return view
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "DarkGray")
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(headerView)
        addSubview(randomWordView)
        addSubview(dividerView)
        
        addSubview(definitionSearchContainerView)
        
        randomWordView.backgroundColor = .red
        
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
    
    @objc func refreshButtonPressed() {
        
        print("Refresh pressed")
    }
}


class HeaderView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.attributedText = NSAttributedString(
            string: "Daily Dose \nof Definitions",
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 32, weight: .bold),
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
        )
        return label
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "September 29, 2021"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(titleLabel)
        addSubview(dividerView)
        addSubview(dateLabel)
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dividerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            dividerView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            dateLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor)
        ])
    }
}
