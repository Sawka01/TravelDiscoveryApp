//
//  DestinationHeaderContainer.swift
//  TravelDiscoveryApp
//
//  Created by Macbook on 17.02.2021.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {

    let imageNames: [String]

    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CustomPageViewController(imageNames: imageNames)
        return pvc
    }

    typealias UIViewControllerType = UIViewController

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
}

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil}

        if index == 0 { return nil }
        return allControllers[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil}

        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }

    var allControllers: [UIViewController] = []

    init(imageNames: [String]) {
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .red

        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)

        allControllers = imageNames.map({ imageName in
            let hostingController =
                UIHostingController(rootView:
                                        Image(imageName)
                                        .resizable()
                                        .scaledToFill())
            hostingController.view.clipsToBounds = true
            return hostingController
        })

        setViewControllers([allControllers.first!],
                           direction: .forward,
                           animated: true,
                           completion: nil)

        self.dataSource = self
        self.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer(imageNames: ["new_york", "japan", "eiffel_tower"])
        NavigationView {
            PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
        }
    }
}
