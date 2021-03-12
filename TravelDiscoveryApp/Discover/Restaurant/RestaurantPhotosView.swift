//
//  RestaurantPhotosView.swift
//  TravelDiscoveryApp
//
//  Created by Khushvaktov Temur on 13.03.2021.
//

import SwiftUI
import Kingfisher

struct RestaurantPhotosView: View {

    let photoUrlStrings = [
        ""
    ]

    var body: some View {
        GeometryReader { proxy in
            ScrollView {

                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: proxy.size.width / 3 - 4, maximum: 300), spacing: 2)

                ], spacing: 4, content: {

                    ForEach(photoUrlStrings, id: \.self) { urlString in
                        KFImage(URL(string: urlString))
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width / 3 - 3, height: proxy.size.width / 3 - 3)
                            .clipped()
                    }

                }).padding(.horizontal, 2)

            }
        }
        .navigationBarTitle("All Photos", displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView()
        }
    }
}
