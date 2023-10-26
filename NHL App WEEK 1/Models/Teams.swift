//
//  Teams.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/25/23.
//

import Foundation

struct NationalHockeyLeague: Codable, Identifiable {
    var id: Int { return UUID().hashValue }
    let copyright: String
    let teams: [Team]
}

struct Team: Codable, Identifiable {
    let id: Int
    let name: String
    let abbreviation: String
    let firstYearOfPlay: String
    let officialSiteUrl: String
}
