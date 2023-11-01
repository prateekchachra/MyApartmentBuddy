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
            return AnyView(view)
        case .tennis:
            let view = Text("Tennis")
            return AnyView(view)
        case .cricket:
            let view = Text("Cricket")
            return AnyView(view)
        case .soccer:
            let view = Text("Soccer")
            return AnyView(view)
        case .othersports:
            let view = MessageListView()
            return AnyView(view)
        case .profile:
            let view = ProfileView()
            return AnyView(view)
        }
        
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6)
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
        .modifier(HideNavigationView())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}
