//
//  StandingViewModel.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//

import Foundation

class StandingViewModel: ObservableObject {
    @Published var StandingsToday =  [Standings]()
    @Published var isLoading = true

    @MainActor
    func getAllStandings() async {
        do {

            let url = URL(string: "https://api-web.nhle.com/v1/standings/now")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            StandingsToday = try JSONDecoder().decode(NHLStandings.self, from: data).standings
            isLoading = false
        } catch {
            print("Error: \(error)")
            isLoading = false
        }
    }
init() {
    Task{
        await getAllStandings()
    }
}

}
