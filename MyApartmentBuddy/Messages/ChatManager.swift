//
//  ChatManager.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 29/10/23.
//

import Foundation


class ChatManager: ObservableObject {
    @Published var messages = [Message.exampleSent, Message.exampleReceived]
    private var group: [Person]
    
    init(
        group: [Person]
    ) {
        self.group = group
        loadMessages()
    }
    private func loadMessages () {
        messages = [Message.exampleSent, Message.exampleReceived]
    }
    
    public func sendMessage(_ message : Message){
        // Networking calls
        messages.append(message)
        // if network failure show error with retry options
    }
}
