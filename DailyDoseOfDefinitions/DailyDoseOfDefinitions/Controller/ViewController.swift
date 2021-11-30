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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view = contentView
        
        
//        let bottomViewController = DefinitionTableViewController()
//        addChild(bottomViewController)
//        MainView().tableView.addSubview(bottomViewController.view)
//        bottomViewController.didMove(toParent: self)
//        bottomViewController.view.frame = MainView().tableView.frame

        
    }


}

