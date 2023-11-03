//
//  AppStateManager.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 26/10/23.
//

import Foundation

class AppStateManager: ObservableObject {
    
    @Published var selectedTab: TabBarButtonType = .cricket
    
    @Published var showPersonsProfile: Person? = nil
    
    @Published var showPurchasePopup : Bool = false
    
    public func showPersonsProfile (_ person: Person){
        self.showPersonsProfile = person
    }
    
    public func showPurchaseScreen () {
        self.showPurchasePopup = true
    }
}
