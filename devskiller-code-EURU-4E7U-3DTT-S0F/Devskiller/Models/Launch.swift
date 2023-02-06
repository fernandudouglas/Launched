//
//  Launch.swift
//  Devskiller
//
//  Created by Fernando Douglas Vieira on 06/02/23.
//  Copyright © 2023 Mindera. All rights reserved.
//

import Foundation

typealias Launches = [Launch]
class Launch: Codable {
    let name: String
    let dateUTC: String
    let rocket: String
    let links: Links
    let success: Bool?
    var rocketInfo: RocketInfo?
    var dateFormatted: String {
        get {
            return formatDate()
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case dateUTC = "date_utc"
        case rocket
        case links
        case success
    }
    
    func setRocketInfo(rocket: RocketInfo) {
        self.rocketInfo = rocket
    }
    
    private func formatDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        if let date = dateFormatterGet.date(from: dateUTC) {
            return dateFormatterPrint.string(from: date)
        }
        return ""
    }
}

struct Links: Codable {
    let patch: Patch
}

struct Patch: Codable {
    let small: String?
}
