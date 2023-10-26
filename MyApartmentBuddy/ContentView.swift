//
//  ContentView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 25/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mng : AppStateManager = AppStateManager()
    
    var body: some View {
        MainView()
            .environmentObject(mng)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
