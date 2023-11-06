//
//  Standings.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//

import Foundation

struct StandingsResponse: Decodable {
    let records: [StandingsRecord]
}

struct StandingsRecord: Decodable {
    let teamRecords: [StandingTeamRecord]
}

struct StandingTeamRecord: Identifiable, Decodable {
    var id: Int { return UUID().hashValue }
    let team: StandingTeam
    let leagueRecord: StandingLeagueRecord
}

struct StandingTeam: Decodable {
    let id: Int
    let name: String
}

struct StandingLeagueRecord: Decodable {
    let wins: Int
    let losses: Int
    let ot: Int
}
