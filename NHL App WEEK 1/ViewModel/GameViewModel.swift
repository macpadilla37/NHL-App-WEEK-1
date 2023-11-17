//
//  GameViewModel.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//

import Foundation

class GameViewModel: ObservableObject {
        @Published var GameDay: [Games] = []
        @Published var isLoading = true

        @MainActor
        func getAllGames() async {
            do {

                let url = URL(string: "https://api-web.nhle.com/v1/schedule/now")!
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                let gameWeek = try JSONDecoder().decode(NHLGamesToday.self, from: data).gameWeek
                
                    for NHLgame in gameWeek {
                        GameDay.append(contentsOf: NHLgame.games)
                        
                    }
                
                isLoading = false
            } catch {
                print("Error: \(error)")
                isLoading = false
            }
        }
    init() {
        Task{
            await getAllGames()
        }
    }

}
