//
//  ViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Class Properties
    
    var contentView = MainView()
    
    
    let bottomContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view = contentView
        
        setUpUI()
        
        let bottomViewController = DefinitionTableViewController()
        addChild(bottomViewController)
        bottomContainerView.addSubview(bottomViewController.view)
        bottomViewController.didMove(toParent: self)
        bottomViewController.view.frame = bottomContainerView.frame

    }
    
    // MARK: - UI Setup
    
    private func setUpUI(){
        view.backgroundColor = .black
        
        view.addSubview(bottomContainerView)
    
        NSLayoutConstraint.activate([
            bottomContainerView.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            bottomContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }


}

