//
//  RandomWordView.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/6/21.
//

import UIKit

class RandomWordView: UIView {
    
    // MARK: - UI Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Programming"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let partsOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "creating a sequence of instructions to enable the computer to do something"
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    let randomWordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Random Word"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.triangle.2.circlepath.circle"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 30
        backgroundColor = .white
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpViews() {
        
        addSubview(titleLabel)
        addSubview(partsOfSpeechLabel)
        addSubview(descriptionLabel)
        addSubview(randomWordLabel)
        addSubview(refreshButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 140),
            
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            partsOfSpeechLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            partsOfSpeechLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -4),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: partsOfSpeechLabel.trailingAnchor),
            
            randomWordLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            randomWordLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            refreshButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            refreshButton.heightAnchor.constraint(equalToConstant: 40),
            refreshButton.widthAnchor.constraint(equalTo: refreshButton.heightAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc func refreshButtonPressed() {
        print("Refresh pressed")
    }
}
