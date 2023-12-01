//
//  HomeViewTab.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//
import SwiftUI
import Foundation

struct HomeTabView: View {
    @State private var searchText = ""
    @ObservedObject var teamViewModel = TeamViewModel()
    var isToggled = false
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("TEAMS")
                        .font(Font.custom("BlackOpsOne-Regular", size: 50))
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 100))
                        .foregroundColor(.white)
                    Image("NHLlogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                }
                .background(.black)
                .ignoresSafeArea()
                
                SearchBar(searchText: $searchText)
                
                List(teamViewModel.NHL.filter {
                    searchText.isEmpty || $0.teamFullName.localizedCaseInsensitiveContains(searchText)
                }) { team in
                    VStack(alignment: .leading){
                        NavigationLink {
                            VStack{
                                Text(team.teamFullName)
                                    .padding(EdgeInsets(top: 80, leading: 20, bottom: 0, trailing: 0))
                                    .font(Font.custom("BlackOpsOne-Regular", size: 50))
                                    .foregroundColor(Color.ui.NLOrange)
                                List{
                                    HStack{
                                        Text("Season Year(s):")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text(String(team.seasonId))
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    HStack{
                                        Text("Games Played:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("\(team.gamesPlayed)")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    HStack{
                                        Text("Wins:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("\(team.wins)")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    HStack{
                                        Text("Losses:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("\(team.losses)")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    HStack{
                                        Text("Points:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("\(team.points)")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    HStack{
                                        Text("Goals For:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("\(team.goalsFor)")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    HStack{
                                        Text("Goals Against:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("\(team.goalsAgainst)")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }

                                    
                                }   .background(.gray)
                                    .scrollContentBackground(.hidden)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                            }.background(.black)
                            .ignoresSafeArea()
                        }label: {
                            Text(team.teamFullName)
                                .font(Font.custom("FjallaOne-Regular", size: 20))
                        }
                    }
                    
                }
                .background(.gray)
                .scrollContentBackground(.hidden)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 0))
            }
            .background(.black)
            .ignoresSafeArea()
        }.accentColor(Color.ui.NLOrange)
    }
}

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search teams", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)

            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .padding(.horizontal, 10)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    HomeTabView()
}
