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
    
    func systemName(for teamName: String) -> String {
        let cleanedName = teamName.replacingOccurrences(of: "[^a-zA-Z0-9]", with: "", options: .regularExpression)
        return cleanedName.lowercased()
    }

    func imageName(for teamName: String) -> String {
        let nameMap: [String: String] = [
            "vegas": "VegasGoldenKnightsLogo",
            "rangers": "NewYorkRangersLogo",
            "boston" :  "BostonBruinsLogo",
            "vancouver" : "VancouverCanucksLogo",
            "losangeles" : "LosAngelesKingsLogo",
            "colorado" : "ColoradoAvalancheLogo",
            "florida" : "FloridaPanthersLogo",
            "toronto" : "TorontoMapleLeafsLogo",
            "dallas" : "DallasStarsLogo",
            "winnipeg" : "WinnipegJetsLogo",
            "detroit" : "DetroitRedWingsLogo",
            "philadelphia" : "PhiladelphiaFlyersLogo",
            "islanders" : "NewYorkIslandersLogo",
            "nashville" : "NashvillePredatorsLogo",
            "washington" : "WashingtonCapitalsLogo",
            "newjersey" : "NewJerseyDevilsLogo",
            "carolina" : "CarolinaHurricanesLogo",
            "tampabay" : "TampaBayLightningLogo",
            "pittsburgh" : "PittsburghPenguinsLogo",
            "arizona" : "ArizonaCoyotesLogo",
            
            "montral" : "MontrealCanadiensLogo",
            
            "edmonton" : "EdmontonOilersLogo",
            "stlouis" : "StLouisBluesLogo",
            "buffalo" : "BuffaloSabresLogo",
            "calgary" : "CalgaryFlamesLogo",
            "seattle" : "SeattleKrakenLogo",
            "minnesota" : "MinnesotaWildLogo",
            "columbus" : "ColumbusBlueJacketsLogo",
            "ottawa" : "OttawaSenatorsLogo",
            "sanjose" : "SanJoseSharksLogo",
            "anaheim" : "AnaheimDucksLogo",
            "chicago" : "ChicagoBlackhawksLogo"
            
        ]

        let systemName = systemName(for: teamName)
        return nameMap[systemName] ?? "NHLlogo"
    }
    
    
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
                List {
                    ForEach(gameViewModel.GameDay, id: \.id) { game in
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
                                Image(imageName(for: game.awayTeam?.placeName.awayTeamName ?? "Unknown"))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                Text(game.awayTeam?.placeName.awayTeamName ?? "Unknown")
                                    .font(Font.custom("FjallaOne-Regular", size: 30))
                                    .frame(width: 150, alignment: .topLeading)
                                Text("\(game.awayTeam?.score ?? 0)")
                                    .font(Font.custom("BlackOpsOne-Regular", size: 40))
                                    .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                            }
                            HStack{
                                Image(imageName(for: game.homeTeam?.placeName.homeTeamName ?? "Unknown"))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                Text(game.homeTeam?.placeName.homeTeamName ?? "Unknown")
                                    .font(Font.custom("FjallaOne-Regular", size: 30))
                                    .frame(width: 155, alignment: .topLeading)
                                Text("\(game.homeTeam?.score ?? 0)")
                                    .font(Font.custom("BlackOpsOne-Regular", size: 40))
                                    .padding(EdgeInsets(top: 0, leading: 75, bottom: 0, trailing: 0))
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

private func getFormattedDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    return dateFormatter.string(from: currentDate)
    }
}

#Preview {
    GameTabView()
}
