//
//  Mission.swift
//  Moonshot2
//
//  Created by Anzhellika Sokolova on 28.01.2021.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

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
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

      var astronautNames: String {
          crew
              .map(\.name)
              .compactMap { name in
                  Self.astronauts.first {
                      $0.id == name
                  }
              }
              .map(\.name)
              .joined(separator: "\n")
      }
}
