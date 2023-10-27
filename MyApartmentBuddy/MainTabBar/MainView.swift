//
//  MainView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 25/10/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appState : AppStateManager
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
            case .badminton:
                let view = Text("Badminton")
                return Text("Badminton")
            
            case .profile:
                return Text("Profile")
            
            case .tennis:
                return Text("Tennis")
            
            case .cricket:
                return Text("Cricket")
            
            case .soccer:
                return Text("Soccer")
            case .othersports:
                return Text("Other Sports")
            }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
        
            VStack {
                HStack{
                    Spacer()
                    TabBarButtonView(type: .badminton)
                    TabBarButtonView(type: .tennis)
                    TabBarButtonView(type: .cricket)
                    TabBarButtonView(type: .soccer)
                    TabBarButtonView(type: .othersports)
                    TabBarButtonView(type: .profile)
                }.frame(height: 100)
                    .padding(.top, 30)
                correctViewForState()
                Spacer()
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}
