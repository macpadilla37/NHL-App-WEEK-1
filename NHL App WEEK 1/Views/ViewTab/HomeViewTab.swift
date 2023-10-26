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
    var body: some View {
        NavigationView {
                    List(teamViewModel.NHL) { team in
                        VStack(alignment: .leading){
                            NavigationLink {
                                VStack{
                                    Text("Team:")
                                    Text(team.name)
                                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 10))
                                    Text("Abbreviation:")
                                    Text(team.abbreviation)
                                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 10))
                                    Text("First Year Team Played:")
                                    Text(team.firstYearOfPlay)
                                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 10))
                                    Link("Site URL", destination: URL(string: team.officialSiteUrl)!)
                                    
                                }
                            }label: {
                                Text(team.name)
                                
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .navigationTitle("Home")
                }
    }
}

#Preview {
    HomeTabView()
}
