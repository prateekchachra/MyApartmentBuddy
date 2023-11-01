//
//  TabBarButtonView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 25/10/23.
//

import SwiftUI

enum TabBarButtonType : String {
    case badminton = "figure.badminton"
    case tennis = "tennis.racket"
    case cricket = "figure.cricket"
    case soccer = "figure.soccer"
    case othersports = "figure.run.square.stack"
    case profile = "person.fill"
    
}

struct TabBarButtonView: View {
    var type: TabBarButtonType
    @EnvironmentObject var appState : AppStateManager
    
    var body: some View {
        Button(action: {appState.selectedTab = type},
               label: {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .if(appState.selectedTab == type, transform: {
                    $0.foregroundColor(type == .tennis ?  Color.green : (type == .badminton ? Color.teal : Color.red))
                })
                .foregroundColor(Color.gray.opacity(0.5))
                .frame(height: 32)
        })
        Spacer()
    }
}

struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(type: .badminton).environmentObject(AppStateManager())
    }
}
