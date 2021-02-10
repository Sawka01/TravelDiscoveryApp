//
//  DiscoverCategoriesView.swift
//  TravelDiscoveryApp
//
//  Created by Macbook on 10.02.2021.
//

import SwiftUI

struct DiscoverCategoriesView: View {

    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "tray.fill"),
        .init(name: "History", imageName: "books.vertical.fill")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
                            VStack(spacing: 8) {
                                Image(systemName: category.imageName)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6154896165, blue: 0.1726504923, alpha: 1)))
                                    .frame(width: 64, height: 64)
                                    .background(Color.white)
                                    .cornerRadius(64)
                                Text(category.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }.frame(width: 68)
                        })
                }
            }.padding(.horizontal)
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }

    typealias  UIViewType = UIActivityIndicatorView

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }
}

struct Place: Decodable, Hashable {
    let name, thumbnail: String
}

class CategoryDetailsViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var places = [Place]()

    @Published var errorMessage = ""

    init() {
        // network code will happen here

        // real network code

        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            // you want to check response statusCode and error

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

                guard let data = data else { return }

                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON:", error)
                    self.errorMessage = error.localizedDescription
                }

                self.isLoading = false
            }
        }.resume() // make sure to have resume
    }
}

struct CategoryDetailsView: View {

    @ObservedObject var vm = CategoryDetailsViewModel()

    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)

            } else {
                ZStack {
                    Text(vm.errorMessage)
                    ScrollView {
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0) {
                                Image("art1")
                                    .resizable()
                                    .scaledToFill()
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                            }.asTile()
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Category", displayMode: .inline)
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }

        DiscoverView()
        //        ZStack {
        //            Color.orange
        //            DiscoverCategoriesView()
        //        }

        //        NavigationView {
        //            NavigationLink(
        //                destination: Text("Transition Screen"),
        //                label: {
        //                    Text("Link")
        //                })
        //        }
    }
}
