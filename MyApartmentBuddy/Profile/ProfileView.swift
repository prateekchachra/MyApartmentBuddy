//
//  ProfileView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 27/10/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing)
            {
                RoundedImage(url: URL(string: "https://avatars.githubusercontent.com/u/14109504"))
                    .frame(height: 200)
                
                Button(action : {}, label: 	{
                    Image(systemName: "pencil")
                        .font(.system(size: 18, weight: .heavy))
                        .foregroundColor(Color.gray.opacity(0.5))
                        .frame(width: 32, height: 32)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                })
                .padding(.vertical, 10)
                .offset(x: -10)
            }
            // Name + Job Title
            Group {
                Spacer().frame(height: 18)
                Text("Prateek, 28")
                .foregroundColor(.textTitle)
                .font(.system(size: 26, weight: .medium))
                Spacer().frame(height: 8)
                Text("Tennis | Badminton | Cricket")
                    .foregroundColor(.textPrimary)
                Spacer().frame(height: 22)
            }
            HStack(alignment: .top) {
                Spacer()
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color.gray.opacity(0.5))
                                .padding(10)
                                .font(.system(size: 30))
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 6)
                            
                            Text("SETTINGS")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.textSecondary)
                        }
                    })
                Spacer()
                Button(action: {}, label: {
                    VStack{
                        Image(systemName: "camera.fill")
                            .foregroundColor(Color.white)
                            .padding(22)
                            .font(.system(size: 38))
                            .background(Color.red)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("ADD MEDIA")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
                Button(action: {}, label: {
                    VStack{
                        Image(systemName: "shield.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .padding(10)
                            .font(.system(size: 30))
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SAFETY")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
                }
            Spacer().frame(height: 14)
            HStack{
                Text("Tennis: 3.8 (92 Percentile) (Intermediate - Professional)")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Button(action: {}, label:
                        {Image(systemName: "info")
                        .font(.system(size: 12, weight: .heavy))
                        .foregroundColor(.pink)
                        .padding(6)
                    
                }).background(Color.white)
                    .clipShape(Circle())
                // TODO: Ratings for all sports + explanation links
            }
            .padding()
            .background(Color.green)
            .cornerRadius(12)
            .padding(.horizontal, 8)
            ZStack {
                Color.gray.opacity(0.15)
                ProfileSwipePromo{
                    //TODO
                }
            }
            .padding(.top, 18)
            
        }
        .foregroundColor(Color.black.opacity(0.75))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackground)
    }
}
