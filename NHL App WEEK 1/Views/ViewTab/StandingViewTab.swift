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
    
    func systemName(for teamName: String) -> String {
        let cleanedName = teamName.replacingOccurrences(of: "[^a-zA-Z0-9]", with: "", options: .regularExpression)
        return cleanedName.lowercased()
    }

    func imageName(for teamName: String) -> String {
        let nameMap: [String: String] = [
            "vegasgoldenknights": "VegasGoldenKnightsLogo",
            "newyorkrangers": "NewYorkRangersLogo",
            "bostonbruins" :  "BostonBruinsLogo",
            "vancouvercanucks" : "VancouverCanucksLogo",
            "losangeleskings" : "LosAngelesKingsLogo",
            "coloradoavalanche" : "ColoradoAvalancheLogo",
            "floridapanthers" : "FloridaPanthersLogo",
            "torontomapleleafs" : "TorontoMapleLeafsLogo",
            "dallasstars" : "DallasStarsLogo",
            "winnipegjets" : "WinnipegJetsLogo",
            "detroitredwings" : "DetroitRedWingsLogo",
            "philadelphiaflyers" : "PhiladelphiaFlyersLogo",
            "newyorkislanders" : "NewYorkIslandersLogo",
            "nashvillepredators" : "NashvillePredatorsLogo",
            "washingtoncapitals" : "WashingtonCapitalsLogo",
            "newjerseydevils" : "NewJerseyDevilsLogo",
            "carolinahurricanes" : "CarolinaHurricanesLogo",
            "tampabaylightning" : "TampaBayLightningLogo",
            "pittsburghpenguins" : "PittsburghPenguinsLogo",
            "arizonacoyotes" : "ArizonaCoyotesLogo",
            
            "montralcanadiens" : "MontrealCanadiensLogo",
            
            "edmontonoilers" : "EdmontonOilersLogo",
            "stlouisblues" : "StLouisBluesLogo",
            "buffalosabres" : "BuffaloSabresLogo",
            "calgaryflames" : "CalgaryFlamesLogo",
            "seattlekraken" : "SeattleKrakenLogo",
            "minnesotawild" : "MinnesotaWildLogo",
            "columbusbluejackets" : "ColumbusBlueJacketsLogo",
            "ottawasenators" : "OttawaSenatorsLogo",
            "sanjosesharks" : "SanJoseSharksLogo",
            "anaheimducks" : "AnaheimDucksLogo",
            "chicagoblackhawks" : "ChicagoBlackhawksLogo"
            
        ]

        let systemName = systemName(for: teamName)
        return nameMap[systemName] ?? "NHLlogo"
    }
    
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
                                    Image(imageName(for: standing.teamName.teamNameFull))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35, height: 35)
                                    Text("\(standing.wins)-\(standing.losses)-\(standing.otLosses)")
                                        .font(Font.custom("FjallaOne-Regular", size: 15))
                                        .frame(width: 50, alignment: .topLeading)
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
