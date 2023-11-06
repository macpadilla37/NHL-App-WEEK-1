//
//  HomeViewTab.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//
import SwiftUI
import Foundation

struct HomeTabView: View {
    @ObservedObject var teamViewModel = TeamViewModel()
    @ObservedObject var standingViewModel = StandingViewModel()
    var body: some View {
        NavigationView {
            List(standingViewModel.finalArray) { teamRecord in
                VStack(alignment: .leading){
                    NavigationLink {
                        VStack{
                            Text("Team:")
                            
                        }
                    }label: {
                        HStack{
                            Text(teamRecord.team.name)
                            Text("\(teamRecord.leagueRecord.wins)")
                                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                            Text("- \(teamRecord.leagueRecord.losses)")
                            Text("- \(teamRecord.leagueRecord.ot)")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                }

                }
            }
                    .navigationTitle("Home")
                }
    }
}

#Preview {
    HomeTabView()
}
