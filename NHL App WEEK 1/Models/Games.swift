//
//  Games.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//

import Foundation

struct NHLGamesToday: Decodable {
    let nextStartDate: String
    let gameWeek: [GameWeek]
}
struct GameWeek: Decodable, Identifiable {
    var id: Int { return UUID().hashValue }
    let date: String
    let games: [Games]
}
struct Games: Decodable, Identifiable {
    var id: Int
    let venueUTCOffset: String?
    let awayTeam: AwayTeam?
    let homeTeam: HomeTeam?
    let periodDescriptor: PeriodDescriptor?
}
struct AwayTeam: Decodable {
    let placeName: AwayTeamName
    let logo: URL
    let score: Int?
}
struct HomeTeam: Decodable {
    let placeName: HomeTeamName
    let logo: URL
    let score: Int?
}

struct AwayTeamName: Codable {
    let awayTeamName: String
    enum CodingKeys: String, CodingKey {
        case awayTeamName = "default"
    }
}
struct HomeTeamName: Codable {
    let homeTeamName: String
    enum CodingKeys: String, CodingKey {
        case homeTeamName = "default"
    }
}
struct PeriodDescriptor: Decodable {
    let number: Int?
}

