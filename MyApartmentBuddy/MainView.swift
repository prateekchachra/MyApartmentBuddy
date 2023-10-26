//
//  MainView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 25/10/23.
//

import SwiftUI

struct MainView: View {
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
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}
