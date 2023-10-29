//
//  MessageView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 29/10/23.
//

import SwiftUI

struct MessageView: View {
    var message:  Message;
    var body: some View {
        HStack {
            if message.fromCurrentUser {
                Spacer()
            }
            ZStack(alignment: .bottomLeading){
              
            Text(message.content)
                .padding(12)
                .foregroundColor(.white)
                .background(message.fromCurrentUser ?
                            Color.blue : Color.gray.opacity(0.6))
                .cornerRadius(10)
                if message.person != nil {
                    Text(message.person?.name ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 8))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 2)
                        
                }
                
            }
            if !message.fromCurrentUser {
                Spacer()
            }
        }.padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message.exampleReceived)
    }
}
