//
//  UserManager.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 2/11/23.
//

import Foundation


class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    @Published var matches : [Person] = []
    
    init() {
        loadUser()
        loadMatches()
    }
    
    private func loadUser() {
        self.currentUser = User.example
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
}
