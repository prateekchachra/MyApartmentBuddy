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
        ScrollView {
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
                Spacer().frame(height: 14)
                ZStack {
                    
                    VStack {
                        ForEach(vm.messagePreviews.filter({searchText.isEmpty ? true : displayPreview($0)}), id: \.self) {preview in
                            
                            NavigationLink(destination: ChatView(group: [preview.person]), label:
                                            {MessageRowView(preview: preview)}
                            ).buttonStyle(PlainButtonStyle())
                                .animation(.easeIn(duration: 0.25))
                                .transition(.slide)
                        }
                    }
                    if (searchText.isEmpty && isEditing){
                        Color.white.opacity(0.5)
                    }
                }
                Spacer()
            }
        }.modifier(HideNavigationView())
    }
    func displayPreview(_ preview : MessagePreview ) -> Bool {
        if preview.person.name.contains(searchText) { return true }
        
        if preview.lastMessage.contains(searchText) { return true }
        
        if preview.person.bio.contains(searchText) { return true }
        return false
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
