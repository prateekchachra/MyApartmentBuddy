//
//  ChatView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 29/10/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatMng : ChatManager
    @State private var typingMessage: String = ""
    
    private var group: [Person]
    init(group: [Person]) {
        self.group = group;
        self.chatMng = ChatManager(group: group)
    }
    var body: some View {
        ZStack (alignment: .top) {
            VStack {
                Spacer().frame(height: 64)
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack {
                        ForEach(chatMng.messages.indices, id: \.self) { index in
                            let msg = chatMng.messages[index]
                            MessageView(message: msg)
                                .animation(.easeIn)
                                .transition(.move(edge: .trailing))
                        }
                    }
                    
                })
                ZStack(alignment: .trailing) {
                    Color.textFieldBackground
                    TextField("Type A Message", text: $typingMessage)
                        .foregroundColor(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                    .padding(.horizontal)
                    
                    Button(action: { sendMessage() }, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                    .foregroundColor(typingMessage.isEmpty ? Color.textPrimary : Color.blue)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                .padding(.horizontal)
                .padding(.bottom)
                
            }
            ChatViewHeader(
                name: group.first?.name ?? "",
                imageURL: group.first?.imageURLs[0]
            ){
                // Video action
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func sendMessage() {
        chatMng.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(group: [Person.example])
    }
}
