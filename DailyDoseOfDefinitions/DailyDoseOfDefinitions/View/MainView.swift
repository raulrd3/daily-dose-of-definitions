//
//  MainView.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/11/21.
//

import Foundation
import UIKit

class MainView: UIView {
    
    // MARK: UI Properties
    
    let headerView: HeaderView = {
            let headerView = HeaderView()
            headerView.translatesAutoresizingMaskIntoConstraints = false
            return headerView
        }()
    
    
    // MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup Views
    
    private func setUpViews(){
        
        addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
}
