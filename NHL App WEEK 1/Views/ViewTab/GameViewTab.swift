//
//  GameViewTab.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//
import SwiftUI
import Foundation

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
                List(gameViewModel.NHLgames){ game in
                    VStack{
                        HStack{
                            HStack{
                                //Text("5:00pm EST")
                                Text("\(game.venueUTCOffset)pm MST")
                                    .font(Font.custom("FjallaOne-Regular", size: 20))
                                Text("Period")
                                    .font(Font.custom("FjallaOne-Regular", size: 12))
                                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                                //Text("0")
                                Text("\(game.periodDescriptor.number)")
                                    .font(Font.custom("FjallaOne-Regular", size: 20))
                            }
                        }
                        HStack{
                            Image("NHLlogo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            Text("Away Team")
                            //Text(game.awayTeam.placeName.awayTeamName)
                                .font(Font.custom("FjallaOne-Regular", size: 30))
                            Text("0")
                            //Text(game.awayTeam.score)
                                .font(Font.custom("BlackOpsOne-Regular", size: 40))
                                .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                        }
                        HStack{
                            Image("NHLlogo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            Text("Home Team")
                            //Text(game.homeTeam.placeName.homeTeamName)
                                .font(Font.custom("FjallaOne-Regular", size: 30))
                            Text("0")
                            //Text(game.homeTeam.score)
                                .font(Font.custom("BlackOpsOne-Regular", size: 40))
                                .padding(EdgeInsets(top: 0, leading: 75, bottom: 0, trailing: 0))
                        }
                    }

                }
                .background(.gray)
                .scrollContentBackground(.hidden)
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
