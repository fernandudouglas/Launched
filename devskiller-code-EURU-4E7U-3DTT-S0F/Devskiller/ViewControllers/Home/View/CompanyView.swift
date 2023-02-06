//
//  CompanyView.swift
//  Devskiller
//
//  Created by Fernando Douglas Vieira on 05/02/23.
//  Copyright © 2023 Mindera. All rights reserved.
//

import UIKit

class CompanyView: UIView {

    private let companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "{companyName} was founded by {founderName} in {year}. It has now {employeesNumber} employees, {launchSites} launch sites, and is valued at USD {valuation}"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(companyLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            companyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            companyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            companyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            companyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
