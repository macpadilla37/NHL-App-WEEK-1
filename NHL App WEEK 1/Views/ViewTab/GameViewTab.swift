//
//  GameViewTab.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//
import SwiftUI
import Foundation
import SVGView

struct GameTabView: View {
    @State private var currentDate = Date()
    @ObservedObject var gameViewModel = GameViewModel()
    var body: some View {
            VStack{
                HStack{
                    Text("GAMES")
                        .font(Font.custom("BlackOpsOne-Regular", size: 50))
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 100))
                        .foregroundColor(.white)
                    Image("NHLlogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                }
                VStack{
                    Text(getFormattedDate())
                        .font(Font.custom("FjallaOne-Regular", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.ui.NLOrange)
                }
                .background(.black)
                .scrollContentBackground(.hidden)
                List(gameViewModel.GameDay){ game in
                    VStack{
                        HStack{
                            Text("\(game.venueUTCOffset ?? "")pm MST")
                                .font(Font.custom("FjallaOne-Regular", size: 20))
                                .frame(width: 120, alignment: .topLeading)
                            Text("Period")
                                .font(Font.custom("FjallaOne-Regular", size: 12))
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                            Text("\(game.periodDescriptor?.number ?? 0)")
                                .font(Font.custom("FjallaOne-Regular", size: 20))
                        }
                        HStack{
                           // AsyncImage(url: game.homeTeam?.logo)
                           // SVGView(url: game.awayTeam.logo)
                              //  .resizable()
                              //  .scaledToFill()
                              //  .frame(width: 40, height: 40)
                            Text(game.awayTeam?.placeName.awayTeamName ?? "Unknown")
                                .font(Font.custom("FjallaOne-Regular", size: 30))
                                .frame(width: 150, alignment: .topLeading)
                            Text("\(game.awayTeam?.score ?? 0)")
                                .font(Font.custom("BlackOpsOne-Regular", size: 40))
                                .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                        }
                        HStack{
                           // AsyncImage(url: game.homeTeam?.logo)
                            //Image("NHLlogo")
                               // .resizable()
                              //  .scaledToFill()
                               // .frame(width: 40, height: 40)
                            Text(game.homeTeam?.placeName.homeTeamName ?? "Unknown")
                                .font(Font.custom("FjallaOne-Regular", size: 30))
                                .frame(width: 155, alignment: .topLeading)
                            Text("\(game.homeTeam?.score ?? 0)")
                                .font(Font.custom("BlackOpsOne-Regular", size: 40))
                                .padding(EdgeInsets(top: 0, leading: 75, bottom: 0, trailing: 0))
                        }
                    }

                }
                .background(.gray)
                .scrollContentBackground(.hidden)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 0))
            }
            .background(.black)
            .ignoresSafeArea()

        
    }

private func getFormattedDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    return dateFormatter.string(from: currentDate)
    }
}

#Preview {
    GameTabView()
}
