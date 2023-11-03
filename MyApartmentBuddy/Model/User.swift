//
//  User.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 2/11/23.
//

import Foundation


struct User {
    var name: String
    
    var goldSubscriber : Bool = false
}

extension User {
    static let example = User(name: "Pratt", goldSubscriber: false)
}
