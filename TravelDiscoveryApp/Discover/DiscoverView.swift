//
//  ContentView.swift
//  TravelDiscoveryApp
//
//  Created by Macbook on 10.02.2021.
//

import SwiftUI

extension Color {
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
}

struct DiscoverView: View {

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }

    var body: some View {
        NavigationView {

            ZStack {

                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9807034135, green: 0.7064926624, blue: 0.2541835904, alpha: 1)), Color(#colorLiteral(red: 0.971444428, green: 0.3731107517, blue: 0.2020016301, alpha: 1))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()

                Color.discoverBackground
                    .offset(y: 400)
                
                ScrollView {

                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()

                    }.font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)

                    DiscoverCategoriesView()

                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }.background(Color.discoverBackground)
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
            }

            .navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
