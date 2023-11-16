//
//  Teams.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/25/23.
//

import Foundation

struct NationalHockeyLeague: Decodable {
    let data: [Team]
}

struct Team: Decodable, Identifiable {
    var id: Int { return UUID().hashValue }
    let seasonId: Int
    let gamesPlayed: Int
    let goalsAgainst: Int
    let goalsFor: Int
    let losses: Int
    let points: Int
    let teamFullName: String
    let wins: Int
}
