//
//  GameViewModel.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//

import Foundation

class GameViewModel: ObservableObject {
        @Published var NHL =  [Team]()
        @Published var isLoading = true
        
        @MainActor
        func getAllGames() async {
            do {
                

                let url = URL(string: "https://statsapi.web.nhl.com/api/v1/teams")!
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                NHL = try JSONDecoder().decode(NationalHockeyLeague.self, from: data).teams
                isLoading = false
            } catch {
                print("Error: \(error.localizedDescription)")
                isLoading = false
            }
        }
    init() {
        Task{
            await getAllGames()
        }
    }
    
}
