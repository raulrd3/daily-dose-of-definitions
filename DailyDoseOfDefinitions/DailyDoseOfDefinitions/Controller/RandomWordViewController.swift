//
//  RandomWordViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/2/21.
//

import UIKit

class RandomWordViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let randomWordView = RandomWordView()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        view = randomWordView
    }
}
