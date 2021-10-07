//
//  HeaderView.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/6/21.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    // MARK: - UI Properties
    
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
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup Methods
    
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
