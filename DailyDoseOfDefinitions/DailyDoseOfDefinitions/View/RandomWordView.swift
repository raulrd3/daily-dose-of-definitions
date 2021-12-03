//
//  RandomWordView.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/15/21.
//

import Foundation
import UIKit


class RandomWordView: UIView {
    
    // MARK: - UI Properties
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DefinedWord"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private var partsOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "p.o.s."
        label.font = UIFont.italicSystemFont(ofSize: 15)
        return label
    }()
    
    private var definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "definition goes here definition goes here definition goes here definition goes here definition goes here definition goes here definition goes here definition goes here definition  "
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 5
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var randomWordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Random Word"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private var refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let largeBoldDoc = UIImage(systemName: "arrow.triangle.2.circlepath.circle", withConfiguration: largeConfig)
        button.setImage(largeBoldDoc, for: .normal)
        
        button.tintColor = .gray
        button.addTarget(self, action: #selector(randomWordGenerator), for: .touchUpInside)
        return button
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 30
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpViews() {
            
            addSubview(titleLabel)
            addSubview(partsOfSpeechLabel)
            addSubview(definitionLabel)
            addSubview(randomWordLabel)
            addSubview(refreshButton)
            addSubview(spinner)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                titleLabel.trailingAnchor.constraint(equalTo: partsOfSpeechLabel.leadingAnchor, constant: -4),
                
                partsOfSpeechLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
                partsOfSpeechLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -2),
                
                definitionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                definitionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                definitionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                
                randomWordLabel.leadingAnchor.constraint(equalTo: definitionLabel.leadingAnchor),
                randomWordLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                
                refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                refreshButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                refreshButton.widthAnchor.constraint(equalTo: refreshButton.heightAnchor),
                
                spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
                spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
    
    // MARK: - Actions
    
    @objc func randomWordGenerator(){
        
        print("Refresh pressed")
        definitionLabel.text = ""
        spinner.startAnimating()
        
        let headers = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key":
                //revoked API key
                "API KEY GOES HERE"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true&hasDetails=definitions")! as URL,
             cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers


        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                    
                    guard let data = data, error == nil else {
                        print("Something went wrong")
                        return
                    }
                    
                    do {
                        let randomWord = try JSONDecoder().decode(Word.self, from: data)
                        print(randomWord)
                        DispatchQueue.main.async { [weak self] in
                            self!.titleLabel.text = randomWord.word
                            self!.definitionLabel.text = randomWord.results?.first?.definition
                            self!.partsOfSpeechLabel.text = randomWord.results?.first?.partOfSpeech
                            self!.spinner.stopAnimating()
                        }
                    }
                    catch {
                        print("Failed to decode WordDetails with error: \(error.localizedDescription)")
                        DispatchQueue.main.async { [weak self] in
                            self?.titleLabel.text = ""
                            self?.definitionLabel.text = "Could not find a random word. \nTap on the bottom right refresh button for a new word."
                            self?.partsOfSpeechLabel.text = ""
                            self?.spinner.stopAnimating()
                        }
                    }
                }.resume()
            }
   
    
}
                                        

