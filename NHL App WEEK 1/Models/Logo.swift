//
//  Logo.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/30/23.
//

import Foundation

struct DataReponce: Decodable {
    let data: [LogoData]
}

struct LogoData: Decodable {
    let id: Int
    let fullName: String
    let teams: [LogoTeams]
}
struct LogoTeams: Decodable {
    let logos: Logologos
}
struct Logologos: Decodable {
    let id: Int
    let url: String
}

