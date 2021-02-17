//
//  DestinationHeaderContainer.swift
//  TravelDiscoveryApp
//
//  Created by Macbook on 17.02.2021.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red
        return redVC
    }

    typealias UIViewControllerType = UIViewController

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer()
    }
}
