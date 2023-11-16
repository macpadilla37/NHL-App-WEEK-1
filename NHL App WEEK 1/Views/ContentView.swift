//
//  ContentView.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("NHLbackground")
                VStack {
                    Text("NHL APP")
                        .font(Font.custom("BlackOpsOne-Regular", size: 70))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(Color.ui.NLOrange)
                    NavigationLink(destination: TabsView().navigationBarBackButtonHidden(true)) {
                        Image("NHLlogo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                    }
                    ZStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 180, height: 30)
                            .cornerRadius(40)
                            .opacity(0.4)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                        Text("Tap Logo to Continue")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                    }
                }
            }
        }
    }
}

struct TabsView: View {
    var body: some View {
            TabView {
                HomeTabView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .toolbarBackground(.black, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
                GameTabView()
                    .tabItem {
                        Label("Games", systemImage: "hockey.puck.fill")
                    }
                    .toolbarBackground(.black, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
                StandingTabView()
                    .tabItem {
                        Label("Standings", systemImage: "list.number")
                    }
                    .toolbarBackground(.black, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
            }
        
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let NLOrange = Color("NHLlogoOrange")
         let LightOrange = Color("NHLlighterOrange")

    }
}

#Preview {
    ContentView()
}
