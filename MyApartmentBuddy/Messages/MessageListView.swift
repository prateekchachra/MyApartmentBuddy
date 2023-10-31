//
//  MessageListView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 31/10/23.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListVM = MessageListVM()
    
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search Matches", text: $searchText)
                    .padding(8)
                    .padding(.horizontal, 24)
                    .background(Color.textFieldBackground)
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.textPrimary)
                                .font(.system(size: 20, weight: .bold))
                                .padding(.leading, 4)
                            Spacer()
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture (perform: {
                        self.isEditing = true
                    })
                    .animation(.easeIn(duration: 0.25))
                
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        self.endEditing(true)
                    }, label: {
                    Text("Cancel")
                            
                    }).padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn(duration: 0.25))
                        
                    }
            }
            
            Text("All of our conversations")
            Spacer()
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
