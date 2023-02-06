//
//  HomeView.swift
//  Devskiller
//
//  Created by Fernando Douglas Vieira on 05/02/23.
//  Copyright © 2023 Mindera. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    private(set) lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: "companyCell")
        tableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: "launchCell")
        return tableView
    }()
    
    private var companyInfo: CompanyInfo? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            }
        }
    }
    
    private var launches: Launches? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func companyInfoDidLoad(companyInfo: CompanyInfo) {
        self.companyInfo = companyInfo
    }
    
    func launchesDidLoad(launches: Launches) {
        self.launches = launches
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : launches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "companyCell", for: indexPath) as? CompanyTableViewCell
            guard let companyInfo else { return UITableViewCell() }
            cell?.setup(with: companyInfo)
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "launchCell", for: indexPath) as? LaunchTableViewCell
            guard let launches else { return UITableViewCell() }
            cell?.setup(with: launches[indexPath.row])
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Company" : "Launches"
    }
}
