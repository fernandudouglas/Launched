//
//  ViewController.swift
//  Devskiller
//
//  Created by Ivo Silva on 18/09/2020.
//  Copyright © 2020 Mindera. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    private let homeView = HomeView()
    private let viewModel: HomeViewModel
    
    override func loadView() {
        self.view = homeView
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "SpaceX"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
    func launchesDataDidLoad(launches: Launches) {
        homeView.launchesDidLoad(launches: launches)
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
        }
    }
    
    func companyDataDidLoad(company: CompanyInfo) {
        homeView.companyInfoDidLoad(companyInfo: company)
    }
    
    
}
