//
//  ChatManager.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 29/10/23.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject {
    @Published var messages = [Message.exampleSent, Message.exampleReceived]
    @Published var keyboardIsShowing : Bool = false
    var cancellable : AnyCancellable? = nil
    
    private var group: [Person]
    
    init(
        group: [Person]
    ) {
        self.group = group
        loadMessages()
        setupPublishers()
    }
    private func loadMessages () {
        messages = [Message.exampleSent, Message.exampleReceived]
    }
    
    public func sendMessage(_ message : Message){
        // Networking calls
        messages.append(message)
        // if network failure show error with retry options
    }
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({_ in true})
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({_ in false})
    
    private func setupPublishers(){
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
    
}
