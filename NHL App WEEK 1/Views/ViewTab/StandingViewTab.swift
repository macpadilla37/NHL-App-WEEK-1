//
//  StandingViewTab.swift
//  NHL App WEEK 1
//
//  Created by Mac Padilla on 10/26/23.
//
import SwiftUI
import Foundation

struct StandingTabView: View {
    var body: some View {
        NavigationView {
            HStack{
                Text("STANDINGS")
                    .font(Font.custom("BlackOpsOne-Regular", size: 50))
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 20))
                    //.foregroundColor(.white)
                Image("NHLlogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}
#Preview {
    StandingTabView()
}
