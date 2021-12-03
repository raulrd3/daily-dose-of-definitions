//
//  SearchDefinitionView.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/16/21.
//

import Foundation
import UIKit
import Alamofire



class SearchDefinitionView: UIView {
    // MARK: - UI Properties
    
    let tableViewCell = DefinitionTableViewCell()
    
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
        textField.placeholder = "Press Search to test diff API"
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

        ])
        

    }
    
    // MARK: - Actions
    
    // Implemented free {JSON} Placeholder API below due to account issues with WordsAPI via RapidAPI
    
    @objc func searchButtonPressed(){
        print("Search pressed")
        
        
        fetchUser { user, error in
            
            if error != nil {
                print("ERROR!")
            }
            
            DispatchQueue.main.async {
                if let user = user {
                    self.searchTextField.placeholder = user.fullName

                }
                else {
                    self.tableViewCell.titleLabel.text = "No User Fetched"
                }
            }
        }

    }
    
    private func fetchUser(completion: @escaping (User?, Error?) -> Void){
        
        AF.request("https://jsonplaceholder.typicode.com/users", method: .get).responseDecodable(of: [User].self){response in
            
            if let error = response.error {
                
                completion(nil, error)
                print(error.localizedDescription)
            }
            
            let firstUser = response.value?.randomElement()
            completion(firstUser, nil)
            
            print("First user: \(String(describing: firstUser))")
            print("Second user: \(String(describing: response.value?[1]))")
            print("Third user: \(String(describing: response.value?[2]))")
        }
    }
}
