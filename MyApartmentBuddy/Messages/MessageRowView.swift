//
//  MessageRowView.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 1/11/23.
//

import SwiftUI
import Kingfisher

struct MessageRowView: View {
    var preview: MessagePreview
    var body: some View {
        HStack {
            RoundedImage(url: preview.person.imageURLs.first)
                .frame( width: 90, height: 90)
            VStack(alignment: .leading, spacing: 8){
                Text(preview.person.name)
                    .font(.system(size: 21, weight: .semibold))
                Text(preview.lastMessage)
                    .foregroundColor(.textPrimary)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.example)
    }
}
