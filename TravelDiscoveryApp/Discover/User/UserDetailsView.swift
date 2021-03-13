//
//  UserDetailsView.swift
//  TravelDiscoveryApp
//
//  Created by Khushvaktov Temur on 13.03.2021.
//

import SwiftUI
import Kingfisher

struct UserDetailsView: View {

    let user: User

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)

                Text("Amy Adams")
                    .font(.system(size: 14, weight: .semibold))

                HStack {
                    Text("@amyadams20 •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("2541")
                }
                .font(.system(size: 12, weight: .semibold))

                Text("Youtuber, Vlogger, Travel Creator")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))

                HStack(spacing: 12) {
                    VStack {
                        Text("59,394")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }

                    Spacer()
                        .frame(width: 0.5, height: 12)
                        .background(Color(.lightGray))

                    VStack {
                        Text("2,112")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 9, weight: .regular))
                    }
                }

                HStack(spacing: 12) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Spacer()
                            Text("Follow")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .cornerRadius(100)
                    })

                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Spacer()
                            Text("Contact")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(100)
                    })
                }.font(.system(size: 12, weight: .semibold))

                ForEach(0..<10, id: \.self) { num in
                    VStack(alignment: .leading) {
                        KFImage(URL(string: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/4aff5261-6cea-49ad-a541-cb70b7f13ed3"))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()

                        HStack {
                            Image("amy")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text("Here is my post title")
                                    .font(.system(size: 14, weight: .semibold))

                                Text("500k views")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                        }.padding(.horizontal, 8)

                        HStack {
                            ForEach(0..<3, id: \.self) { num in
                                Text("#Traveling")
                                    .foregroundColor(Color(#colorLiteral(red: 0.09295179103, green: 0.4745024949, blue: 1, alpha: 1)))
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color(#colorLiteral(red: 0.9117253161, green: 0.9228230573, blue: 0.9481678299, alpha: 1)))
                                    .cornerRadius(20)
                            }
                        }.padding(.bottom)
                        .padding(.horizontal, 8)

                    }
//                    .frame(height: 200)
                    .background(Color(white: 1))
                    .cornerRadius(12)
                    .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                }

            }.padding(.horizontal)

        }.navigationBarTitle(user.name, displayMode: .inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(user: .init(name: "Amy Adams", imageName: "amy"))
        }
    }
}
