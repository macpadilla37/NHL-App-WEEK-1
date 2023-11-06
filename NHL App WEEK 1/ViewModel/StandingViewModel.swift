//
//  StandingViewModel.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//

import Foundation

class StandingViewModel: ObservableObject {
        @Published var finalArray: [StandingTeamRecord] = []
        @Published var isLoading = true
        
        @MainActor
        func getAllStandings() async {
            do {
                

                let url = URL(string: "https://statsapi.web.nhl.com/api/v1/standings")!
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                let records = try JSONDecoder().decode(StandingsResponse.self, from: data).records
                
                    for record in records {
                        finalArray.append(contentsOf: record.teamRecords)
                    }
                
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
    
