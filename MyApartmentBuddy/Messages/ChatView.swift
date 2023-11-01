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
    @State private var scrollProxy: ScrollViewProxy? = nil
    
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
                    ScrollViewReader { proxy in
                        
                        LazyVStack {
                            ForEach(chatMng.messages.indices, id: \.self) { index in
                                let msg = chatMng.messages[index]
                                MessageView(message: msg)
                                    .animation(.easeIn)
                                    .transition(.move(edge: .trailing))
                                    .id(index)
                            }
                        }.onAppear(perform : {scrollProxy = proxy})
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
        .modifier(HideNavigationView())
        .onChange(of: chatMng.keyboardIsShowing , perform: { value in
            if value {
                scrollToBottom()
            }
        })
        .onChange(of: chatMng.messages, perform: {_ in
            scrollToBottom()
        })
    }
    
    func sendMessage() {
        chatMng.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
    
    func scrollToBottom () {
        withAnimation{
            scrollProxy?.scrollTo(chatMng.messages.count - 1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(group: [Person.example])
    }
}
