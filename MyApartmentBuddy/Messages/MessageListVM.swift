//
//  MessageListVM.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 31/10/23.
//

import Foundation

class MessageListVM: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init(){
        loadPreviews()
    }
    func loadPreviews(){
        //TODO: Handle networking to load preview messages from a server
        self.messagePreviews = MessagePreview.examples
    }
    
}
