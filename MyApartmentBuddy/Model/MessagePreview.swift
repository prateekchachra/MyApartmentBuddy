//
//  MessageThread.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 29/10/23.
//

import Foundation

struct MessagePreview: Hashable {
    var person : Person;
    var lastMessage: String;
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there. How are you doing today? How's the waether ")
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example, lastMessage: "Hello there. How are you doing today? How's the waether "),
        MessagePreview(person: Person.example2, lastMessage: "Hi Prateek! When's the match")
    ]
}
