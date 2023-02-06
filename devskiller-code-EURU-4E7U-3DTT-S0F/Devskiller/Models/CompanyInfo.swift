//
//  CompanyInfo.swift
//  Devskiller
//
//  Created by Fernando Douglas Vieira on 06/02/23.
//  Copyright © 2023 Mindera. All rights reserved.
//

import Foundation

// MARK: - CompanyInfo
struct CompanyInfo: Codable {
    let headquarters: Headquarters
    let name, founder: String
    let founded, employees, vehicles, launchSites: Int
    let testSites: Int
    let ceo, cto, coo, ctoPropulsion: String
    let valuation: Int
    let summary, id: String
    
    enum CodingKeys: String, CodingKey {
        case headquarters, name, founder, founded, employees, vehicles
        case launchSites = "launch_sites"
        case testSites = "test_sites"
        case ceo, cto, coo
        case ctoPropulsion = "cto_propulsion"
        case valuation, summary, id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.headquarters = try container.decode(Headquarters.self, forKey: .headquarters)
        self.name = try container.decode(String.self, forKey: .name)
        self.founder = try container.decode(String.self, forKey: .founder)
        self.founded = try container.decode(Int.self, forKey: .founded)
        self.employees = try container.decode(Int.self, forKey: .employees)
        self.vehicles = try container.decode(Int.self, forKey: .vehicles)
        self.launchSites = try container.decode(Int.self, forKey: .launchSites)
        self.testSites = try container.decode(Int.self, forKey: .testSites)
        self.ceo = try container.decode(String.self, forKey: .ceo)
        self.cto = try container.decode(String.self, forKey: .cto)
        self.coo = try container.decode(String.self, forKey: .coo)
        self.ctoPropulsion = try container.decode(String.self, forKey: .ctoPropulsion)
        self.valuation = try container.decode(Int.self, forKey: .valuation)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.id = try container.decode(String.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.headquarters, forKey: .headquarters)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.founder, forKey: .founder)
        try container.encode(self.founded, forKey: .founded)
        try container.encode(self.employees, forKey: .employees)
        try container.encode(self.vehicles, forKey: .vehicles)
        try container.encode(self.launchSites, forKey: .launchSites)
        try container.encode(self.testSites, forKey: .testSites)
        try container.encode(self.ceo, forKey: .ceo)
        try container.encode(self.cto, forKey: .cto)
        try container.encode(self.coo, forKey: .coo)
        try container.encode(self.ctoPropulsion, forKey: .ctoPropulsion)
        try container.encode(self.valuation, forKey: .valuation)
        try container.encode(self.summary, forKey: .summary)
        try container.encode(self.id, forKey: .id)
    }
}

// MARK: - Headquarters
struct Headquarters: Codable {
    let address, city, state: String
    
    enum CodingKeys: CodingKey {
        case address
        case city
        case state
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(String.self, forKey: .address)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.state, forKey: .state)
    }
}
