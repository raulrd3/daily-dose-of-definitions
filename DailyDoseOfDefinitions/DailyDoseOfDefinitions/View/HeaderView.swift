//
//  HeaderView.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/11/21.
//

import Foundation
import UIKit

class HeaderView: UIView {
        

    
    // MARK: - UI Properties
    
    private var headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textColor = .white
        label.text = "Daily Dose of Definitions"
        return label
    }()
    
    private var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.textColor = .white
        
        let today = Date()
        let dateF = DateFormatter()
        dateF.dateStyle = .short
        label.text = dateF.string(from: today)
        
        return label
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
    
    private func setUpViews(){
        addSubview(headerTitle)
        addSubview(dividerView)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            headerTitle.topAnchor.constraint(equalTo: topAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dividerView.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 5),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            dateLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
