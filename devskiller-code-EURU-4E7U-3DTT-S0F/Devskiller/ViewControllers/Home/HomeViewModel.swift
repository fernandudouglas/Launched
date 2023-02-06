//
//  HomeViewModel.swift
//  Devskiller
//
//  Created by Fernando Douglas Vieira on 06/02/23.
//  Copyright © 2023 Mindera. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate {
    func companyDataDidLoad(company: CompanyInfo)
    func launchesDataDidLoad(launches: Launches)
}

class HomeViewModel {
    
    var delegate: HomeViewModelDelegate?
    
    init() {
        fetchCompanyInfo()
        fetchLaunches()
    }
    
    private func fetchCompanyInfo() {
        Networking.shared.get(model: CompanyInfo.self,
                              endPoint: URL(string: "https://api.spacexdata.com/v4/company")!) { [weak self] result in
            switch result {
                case .success(let company):
                    self?.delegate?.companyDataDidLoad(company: company)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    private func fetchLaunches() {
        Networking.shared.get(model: Launches.self,
                              endPoint: URL(string: "https://api.spacexdata.com/v4/launches")!) { [weak self] result in
            switch result {
                case .success(let launches):
                    self?.fetchRocketNameHandler(launches: launches)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    private func fetchRocketName(for id: String, completion: @escaping (RocketInfo) -> Void) {
        Networking.shared.get(model: RocketInfo.self,
                              endPoint: URL(string: "https://api.spacexdata.com/v4/rockets/\(id)")!) { result in
            switch result {
                case .success(let rocket):
                    completion(rocket)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    private func fetchRocketNameHandler(launches: Launches) {
        let semaphore = DispatchSemaphore(value: 0)
        let dispatchQueue = DispatchQueue.global(qos: .background)
        dispatchQueue.async {
            for launch in launches {
                self.fetchRocketName(for: launch.rocket) { rocket in
                    launch.setRocketInfo(rocket: rocket)
                    semaphore.signal()
                }
                semaphore.wait()
            }
            self.delegate?.launchesDataDidLoad(launches: launches)
        }
    }
    
}






