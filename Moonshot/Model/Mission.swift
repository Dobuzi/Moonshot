//
//  Mission.swift
//  Moonshot
//
//  Created by 김종원 on 2020/10/25.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}

struct CrewRole: Codable {
    let name: String
    let role: String
}
