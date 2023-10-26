//
//  ContentView.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var teamViewModel = TeamViewModel()
    
    var body: some View {
            TabView {
                HomeTabView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                GameTabView()
                    .tabItem {
                        Label("Games", systemImage: "hockey.puck.fill")
                    }
                
                StandingTabView()
                    .tabItem {
                        Label("Standings", systemImage: "list.number")
                    }
                
                PhotoTabView()
                    .tabItem {
                        Label("Photos", systemImage: "photo.on.rectangle.fill")
                    }
            }
        
    }
}

#Preview {
    ContentView()
}
