//
//  SearchDefinitionsViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/9/21.
//

import UIKit

class SearchDefinitionsViewController: UIViewController {

    let contentView = SearchDefinitionView()
    
    override func loadView() {
        view = contentView
    }
}
