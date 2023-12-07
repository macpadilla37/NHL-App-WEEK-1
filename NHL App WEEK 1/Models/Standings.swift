//
//  Standings.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//

import Foundation

struct NHLStandings: Decodable {
    let standings: [Standings]
}

struct Standings: Decodable, Identifiable {
    var id: Int { return UUID().hashValue }
    let gamesPlayed: Int
    let points: Int
    let wins: Int
    let losses: Int
    let otLosses: Int
    let teamName: TeamName
    
}

struct TeamName: Codable {
    let teamNameFull: String
    enum CodingKeys: String, CodingKey {
        case teamNameFull = "default"
    }
}
