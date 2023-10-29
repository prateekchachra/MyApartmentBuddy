//
//  ProfileSwipePromo.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 28/10/23.
//

import SwiftUI

struct ProfileSwipePromo: View {
    var action: () -> Void
    var body: some View {
        VStack(spacing: 0){
            TabView{
                VStack(spacing: 9){
                    Spacer()
                    Text("Choose a group to play with")
                        .font(.system(size: 26, weight: .semibold))
                    Text("Choose a sport and meet new friends!")
                        
                }
                .padding(.bottom, 64)
                .padding(.horizontal, 4)
                VStack(spacing: 9){
                    Spacer()
                    Text("Play competitively and improve your rating")
                        .font(.system(size: 26, weight: .semibold))
                    Text("Other people can rate you for team sports!")
                }  .padding(.bottom, 64)
                    .padding(.horizontal, 4)
                VStack(spacing: 9){
                    Spacer()
                    Text("Find passionate people nearby!")
                        .font(.system(size: 26, weight: .semibold))
                    Text("Easiest way to meet new people and play the sport YOU love!")
                }
                .padding(.bottom, 64)
                .padding(.horizontal, 4)
            }
            .tabViewStyle(PageTabViewStyle())
            
            Button(action: { action() }, label: {
                Text("BOOK NOW!")
                    .foregroundColor(.red)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.2), radius: 10)
            })
            .padding(.bottom, 18)
        }
    }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            ProfileSwipePromo{
                print("Test")
            }
        }.frame(height: 400)
    }
}
