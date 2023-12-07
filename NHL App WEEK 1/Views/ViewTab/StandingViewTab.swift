//
//  StandingViewTab.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//
import SwiftUI
import Foundation

struct StandingTabView: View {
    @ObservedObject var standingViewModel = StandingViewModel()
    var body: some View {
        VStack{
            HStack{
                Text("STANDINGS")
                    .font(Font.custom("BlackOpsOne-Regular", size: 50))
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 20))
                    .foregroundColor(.white)
                Image("NHLlogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            }
        VStack{
            HStack{
                Text("TEAM / RECORD")
                    .font(Font.custom("FjallaOne-Regular", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.ui.NLOrange)
                    .frame(width: 190, alignment: .topLeading)
                Text("GP")
                    .font(Font.custom("FjallaOne-Regular", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.ui.NLOrange)
                    .frame(width: 35, alignment: .topLeading)
                Text("PTS")
                    .font(Font.custom("FjallaOne-Regular", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.ui.NLOrange)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            }
        }
            .background(.black)
            .scrollContentBackground(.hidden)
            HStack{
                List {
                    ForEach(Array(standingViewModel.StandingsToday.enumerated()), id: \.element.id) { index, standing in
                        HStack {
                            VStack{
                                Text("\(index + 1). \(standing.teamName.teamNameFull)")
                                    .font(Font.custom("FjallaOne-Regular", size: 20))
                                    .frame(width: 210, alignment: .topLeading)
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                                HStack{
                                    Text("\(standing.wins)")
                                        .font(Font.custom("FjallaOne-Regular", size: 15))
                                    + Text("-")
                                        .font(Font.custom("FjallaOne-Regular", size: 15))
                                    + Text("\(standing.losses)")
                                        .font(Font.custom("FjallaOne-Regular", size: 15))
                                    + Text("-")
                                        .font(Font.custom("FjallaOne-Regular", size: 15))
                                    + Text("\(standing.otLosses)")
                                        .font(Font.custom("FjallaOne-Regular", size: 15))
                                }
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 40))
                            }
                            Text("\(standing.gamesPlayed)")
                                .font(Font.custom("BlackOpsOne-Regular", size: 20))
                                .frame(width: 45, alignment: .topLeading)
                            Text("\(standing.points)")
                                .foregroundColor(Color.ui.NLOrange)
                                .font(Font.custom("BlackOpsOne-Regular", size: 40))
                                .frame(width: 80, alignment: .topLeading)
                        }
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
}
#Preview {
    StandingTabView()
}
