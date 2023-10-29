//
//  MessageThread.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 29/10/23.
//

import Foundation

struct MessagePreview {
    var person : Person;
    var lastMessage: String;
}

extension MessagePreview {
    static let exampleSent = MessagePreview(person: Person.example, lastMessage: "Hello there")
}
