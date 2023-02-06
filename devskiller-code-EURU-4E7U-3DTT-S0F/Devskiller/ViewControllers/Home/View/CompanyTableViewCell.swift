//
//  CompanyTableViewCell.swift
//  Devskiller
//
//  Created by Fernando Douglas Vieira on 05/02/23.
//  Copyright © 2023 Mindera. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        self.contentView.addSubview(companyLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            companyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            companyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            companyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            companyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(with company: CompanyInfo) {
        self.companyLabel.text = "\(company.name) was founded by \(company.founder) in \(company.founded). It has now \(company.employees) employees, \(company.launchSites) launch sites, and is valued at USD \(company.valuation)"
    }
}
