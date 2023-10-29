//
//  RoundedImage.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 27/10/23.
//

import SwiftUI
import Kingfisher


struct RoundedImage: View {
    var url: URL?
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://avatars.githubusercontent.com/u/14109504"))
    }
}
